# 建立執行環境
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# 建立建置環境
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# 複製 csproj 並還原依賴
COPY *.csproj .
RUN dotnet restore

# 複製其他檔案並建置
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Final 映像
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "DockerTest.dll"]