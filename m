Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B836B53B6
	for <lists.virtualization@lfdr.de>; Fri, 10 Mar 2023 23:04:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5241041CA1;
	Fri, 10 Mar 2023 22:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5241041CA1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=GG/kEx9g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JVJ/P5nU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXT1BxxBfcRg; Fri, 10 Mar 2023 22:04:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2342341C91;
	Fri, 10 Mar 2023 22:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2342341C91
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8BCAC0032;
	Fri, 10 Mar 2023 22:04:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C00A9C0090
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F1C40A37
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F1C40A37
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=GG/kEx9g; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=JVJ/P5nU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBuxtD8q5UiF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E623B408F9
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E623B408F9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:03:58 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ALhqog029136; Fri, 10 Mar 2023 22:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=5kCLBujkWUw5LQO4rqHkzi+74eHake+R1P/q+VfpZW0=;
 b=GG/kEx9gXbBw+vwpSYGklEUorcoAzobW+LcaTSP2KyCH5868kUgZNEX83oVqCMje0keD
 FfO0e9WVTQ8jwo+x7N2p0GSJni2ZBVfDK615tePoDghUezmpM+PPt+SnPH36ZfybRb8L
 MBVoJK3D1y2xkhNmjlgDT3cliSaHEsxgkkpushJIGJbHs7MyEW++JcmFL7+654uniiBn
 HenAwDjN5XK0rIhqgAzjDFXB6WRZkDWkoGh6eOXJ84Df2xrGEoUwdjABpfzOdciH3fYb
 WO2yjtro8z+A/LCZB9MP3Jp6Rj/Nl4ueC1UPzE7/05oS13iSNf9drX9yVEMkK4/VisMj ZA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415j6dek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:43 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32ALtb67031546; Fri, 10 Mar 2023 22:03:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p6feqrwk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO8N2P9Uzyj1D1k9dF4cCLQHCbFII7JYhOQlf9rwTkIoevw+Mx4xL/c61GH2EPS97rQFsxt8E40U3glEt0126tTSrWUWjkc4iNIu0ywK0nc88+/rPSUVYbuvx7uc/LV/2jcXlaPMvpMZBooY2wh4INcirVSHlZfNHR3yFMBb5FZCFFS5XSsj9qaqTNUO3+hijILHb85y8W54LEC+6xBnHyP+eSIFtVab+uR/bgrGEuE1nijCeKqgqmmMrYlnZ99HXKw07wsA+CW7wknmWUgrW7DJnV5HJmYtVq0Gpw7U0IJZTisQYgipR3caKNpzxCbVRVt+a9lvDYsH1btP4Vr3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kCLBujkWUw5LQO4rqHkzi+74eHake+R1P/q+VfpZW0=;
 b=Pg1rxkUNp9lbM/ert2WSF29i+EmTKteqxm9uqQ96UTuCIu2gTjhv9keD+eaDlrYjaaAzBL/2Y6ri+E5105reEKLA1Ku7XpFJHdb8UCFENDvr4inj3M6/t/ROBvlt1iw8XVjzSocxloZzEQYf5JiG4bWkjqNMyku+u33nNqJDs8C7/oKNYacIPKOSE7TDIo+mx1P0iCjfLU2Ljbs48Rln2j/VXiHxwnmXV+uE9XP0lxZXmMgso8DMFF9XX01WPzhRxuRPw9mFtw8XeFdqVQbcy+j5pnpE7apxiJWyqjjb/O4ANO5Zo8tEvy5j57HuS0bBzI913QD4I5qbKcX2BFLQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kCLBujkWUw5LQO4rqHkzi+74eHake+R1P/q+VfpZW0=;
 b=JVJ/P5nUQMRS0VJO7bgHyJLZVR7u/I1qRLzsQW/mC96kpn5uKdlDcA13bTVyMDBDeVN1CNevp11oq1H0a65SULi5w1pBS4nZ6VZmI5UpsCZtf1TSYZhz1arHfYsKWzFBpI3CaXZvXZObGE73N3/8MjPiau8WAlT+leUOu00f2q4=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 22:03:36 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 22:03:36 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, torvalds@linux-foundation.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] csky: Remove kernel_thread declaration
Date: Fri, 10 Mar 2023 16:03:22 -0600
Message-Id: <20230310220332.5309-2-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310220332.5309-1-michael.christie@oracle.com>
References: <20230310220332.5309-1-michael.christie@oracle.com>
X-ClientProxiedBy: DS7PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:8:57::22) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcc29ba-9d9d-483f-2963-08db21b34c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xLS49cVWNuBowvkDvZLJ27DiV/AjnrjDaJqwZsgXFXdZjcUbxTzU3qo7vz9DC94jzT2QHkd/I5PVutXbz7E0ZISHdgG6Vs/48Lq52AJFJQZNI4rgeb9M4patDDP871FU8tH8YZtV3aXy5Gn4iaY+4/0stBhgOwCYSyh0CBNmOinAkIHmuvN/QLCAZdUPQ6XyRl0sz3XS32K9iFPBQkoIMAbSHPk5y51tVJFhv6/yy7WV9FBS7LfiHdyiNfE5Lbpn0JrKT0RgxP/Y87gwePL7/7tnc13Wy+0bs9vuVAu3E9VJSxLnFiMnLE3G/HwS3HIpM8PyfsHgMwv2QmoadbBxg38NeDLEU/XlBIMQUj8Gw2JFU5c0ivAkY8cUVfLuTCCFAMZ15J8bXfAEDNeho8o69gwiPyT12YFp4BrA9fMa8K1Oof+SQCUJXtGiAgvUQpJlpmNTm9P+ZVPyk20anWjnvaBkpAo2yRY+7JSFT+33uFOe8H4XazJFBQEemeeLAMHKt8l6Uw3j/+j//dJTqRoupxsS0BYiZrLMtHQM6JGL4wMwTPg1/0K5Uf29Mr5vEcPwdEGjWsnjmVClg3AxDf2P3V5ifF3EATKquzQQ2dkBWnjrOVIEfN6yUV3nB83BusO9pCZz1h8il7k4CpbG+3KET00MQovuOOuK83z3iOfNHawC5cJUwqUzUuKMkTTQoQlq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(36756003)(6486002)(186003)(6512007)(66556008)(6666004)(2616005)(107886003)(1076003)(7416002)(83380400001)(26005)(8676002)(66946007)(4326008)(41300700001)(5660300002)(4744005)(2906002)(66476007)(8936002)(478600001)(6506007)(86362001)(316002)(38100700002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N+6x8fXM0PLUEX44GayoZk/smwZUiN+ZYlVwKu496hoyxBB+EWLle36yoLHm?=
 =?us-ascii?Q?ILX2OmKInR0r/qW2G4zzPZ64vBvaG3bRQTXuGvlb1sRwW8v2JFc1QooDd5D1?=
 =?us-ascii?Q?CKjbDGR5R0X38kmVlPF/rml5tEv0uzDc2b+8xMQp3V0L8lyZ1bC6sQWRhC/t?=
 =?us-ascii?Q?dHBkr4f7dQxlF3YVVCD3Ykn7l0v5Su1d4k4vUU49xBnqA5lOQ+H9n/n6HtNa?=
 =?us-ascii?Q?i7r8VHENR5ZcNAkAIzZ0cIzKvb+kD36C33sjQvl+e8HKHExxD/XQF93QrE42?=
 =?us-ascii?Q?GMUYwJ17u5hTBLI4dapPl2NMSJQxxXp/nUAKW56+uMEPI/oL5efVG8xRTQBi?=
 =?us-ascii?Q?H/J0SxCwu3F9LTZLghqKXPmV20lRAP32DWQjhlhf5GsmW5momj7qBQVkjtQn?=
 =?us-ascii?Q?ttZdXtztMvJ7rW09C4nLm3/QL59XqP37xJcMvkdr6hHPKfjM37OZBm8Nuv8+?=
 =?us-ascii?Q?BJK44nswjzSwDseDbPGYWOHyLLa452zdDYwIfPOss9wkkZK7g/neH2VFH23A?=
 =?us-ascii?Q?fcI6Azfi5GXPLXXTa3S7GvN55kE/IJGusSjPWaLCMPik4rPzGPrQOySd7gNF?=
 =?us-ascii?Q?erCrawV5660FNcVLr/4GLkG5ARZ0M7InS7tbLv8dwofhumMNUpKlNK4uy1Ju?=
 =?us-ascii?Q?RF4LG5845GXywm7sVjSdocGDq6aP0Jh/rWOhrEWWiZWq3w+uAQpbRwbzd2j+?=
 =?us-ascii?Q?7RkVUrrb+w+XFak+veHmReCEXv7FpqWW3zOUgd9C5WjDjmb5fqgd2WORhVuh?=
 =?us-ascii?Q?fqUwao70FYAxLUSA9jUYOYOSatudRFmbJVYohL7ehtnfma9P5/zkjecUh+py?=
 =?us-ascii?Q?QsQE+KaCxgpqQeImCxEHxLgGMpIbO2IwSqwv9paaj8bsZV0rC9nNKeIkM2Vf?=
 =?us-ascii?Q?dSoHvJIqgaIAe5RGpcOJaTxavfd9IoUoDQSoCbAGOUD0AdaSJdcffHirK2xo?=
 =?us-ascii?Q?rz01tFWU1e+TZ7lNsRr2jqwnslq2agMi5KtcJDkZ7jZMKgBwv28j1+ZK/udd?=
 =?us-ascii?Q?Wx4+CXpBT0CUsnDXxmtoPL7+C0SswUZvZsdqsOrEnj+69XRYBe8PvU5k4ZI7?=
 =?us-ascii?Q?N4xQsK9tXNA92f2QL7K7BYUIScnPrnl6m3frA/iQJiqTcD9/K8l2OZjTcA6V?=
 =?us-ascii?Q?D4UYSK5+WIV7qhU6zTMbC1H3WLNXlxT/l/wfwebo5U0OdaE59FYUq28kuStE?=
 =?us-ascii?Q?TSDCjwChqBb9eo9DFW2HfXUlDlnFFskPUTWfkxoUTjvH7lgyb+mcDTeKa4vP?=
 =?us-ascii?Q?UFHwb4bEgff0qK0gxE/K2RVAZnXAhJK5UpTgu87Rch3/3t0Gwzg31pfl7srO?=
 =?us-ascii?Q?n6Q2c5PgE31HWTiuhiYwIPklFhqM6sLC9GyXgjL8t1dqNkX2w0D6oPLICcRD?=
 =?us-ascii?Q?pA7cMUhYnw6Atg0K3g4BBU/xI7LYE4e8+rzWZwHAKknPJIkUNkcEgEpCZKLk?=
 =?us-ascii?Q?fAWHYGIxsYMIds2qtHNJGcIzoRyUp4Tmo7vn7X6Y+7x1KYW7863h9JiOFUg6?=
 =?us-ascii?Q?Pf88UcpzViTUF6DRFsyClFKMKY8wiYHlP0MpXP1zvcnPKtJ1J9gHnH/QwBwp?=
 =?us-ascii?Q?ElpPh8OkyFiHC42lW7cs7XGRu83u99xlAiW7NL5hqW1tAuuPoocBqx/M+IIt?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?3p656yhP55LNoSDRABQuvVGdxB8IY6qz2ii1OlZNapnRvlh7cjnjEgtgamlJ?=
 =?us-ascii?Q?Sghgn6rZmD8M94kPp8JWKYluoluI+CYTzOAY3IFB9/fh6yi1oPfwf10e1CQn?=
 =?us-ascii?Q?gA9GTo39GuSQJeV+G1lxRR3ED1eyQxCSw2vbN7OHDCDXXW7LoD/79uoIKb+I?=
 =?us-ascii?Q?QQJZsABxxgkdkv4v6fexMwO1XzUKKbplJqeXzmUXPKfO6MG9LJO/otud439W?=
 =?us-ascii?Q?4YZ5zr25OOffq2Ce5Q6Qi3hyb6TB6nzJ5ARN8mNzRclQ4Jkiepi7PyKYlG8n?=
 =?us-ascii?Q?qWZIHj4iv0d7DrG/Wz/RYsjQ1Ca5tdgXVNeXJkPpuYapaXNN9SXEkbX+tmqM?=
 =?us-ascii?Q?tIDrk6Og9myexayWjlh+ox1cKE6rNQQKnuf3KH21CfiJ30NfzRsYbMWLxwND?=
 =?us-ascii?Q?tfl9PeT+5E5M0NkHuP9qw4sFZTCAaakbVIvTzAUw64wiag8ko6De5UibIDLe?=
 =?us-ascii?Q?Q8eF/k8jFpux6SfQ8aQlKOa6U6A0I3ogynyh59lpHo3U7Jq78wcmfQHEC3g4?=
 =?us-ascii?Q?tJY5IkKB9cy8jAd0fgndDQf/GAhWoQCOVlJCFDBylCb4xHsfvczSR6ZtAGA/?=
 =?us-ascii?Q?t7XMdLboDoaIpiUycMpWTigC1FsKt2rZ5p6DvuVpRUeYf1LFG2OxkaD8gXbo?=
 =?us-ascii?Q?gxGz2RvfzbcQEChw5yywph/rVucCoX+O/5RoCzHoHscc39SomkL8NB0Y26jo?=
 =?us-ascii?Q?egEGFx434M14K0MOOjHPYl40x92KxtWIWBoXXSkj+SegdAHrJo+kRscdB/hF?=
 =?us-ascii?Q?OP0xqe4QJSyZclRK4DH2BVtBoDeI/wnVUdJylc0u5YLGa/uD2lRAG0SoQtfU?=
 =?us-ascii?Q?7tSxy4kPd9VE2mQh184whRFqrLUz+/28qQ1aO1T1FMZoc4fx2DNwp06Uy0O2?=
 =?us-ascii?Q?6SF1nVmhPkEQGQigqb8VDStqQqyzOC9QDZ0cCFSeuKbvEX4PY3HBG7XAHHiz?=
 =?us-ascii?Q?DQs9e7yq9Wl4x9YmM4KEHkwqzpDODgHX3Kks2IjF99vhe0EgPFbPIz098Yr5?=
 =?us-ascii?Q?e3XqDiPucCIG0MvvkzqjtMJtUw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcc29ba-9d9d-483f-2963-08db21b34c42
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 22:03:36.7198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxjowuhVSFlv1/JSJZocF44bVLr8kMcj4i/Deyt7RYUD/qCzuTay22dEPB/ITGf3UnX5LITHDlJiPfYJp7ED9jbRf0XQQVUzSrUH3FsYUxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 mlxlogscore=977 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100176
X-Proofpoint-GUID: -dddLJ4PZ05YJ8STl7rvkspGNMi3YZBP
X-Proofpoint-ORIG-GUID: -dddLJ4PZ05YJ8STl7rvkspGNMi3YZBP
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Remove csky's kernel_thread declaration because it's not needed.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 arch/csky/include/asm/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/csky/include/asm/processor.h b/arch/csky/include/asm/processor.h
index ea75d72dea86..e487a46d1c37 100644
--- a/arch/csky/include/asm/processor.h
+++ b/arch/csky/include/asm/processor.h
@@ -72,8 +72,6 @@ struct task_struct;
 /* Prepare to copy thread state - unlazy all lazy status */
 #define prepare_to_copy(tsk)    do { } while (0)
 
-extern int kernel_thread(int (*fn)(void *), void *arg, unsigned long flags);
-
 unsigned long __get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->pc)
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
