Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5229A6B53BC
	for <lists.virtualization@lfdr.de>; Fri, 10 Mar 2023 23:04:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2FCD82366;
	Fri, 10 Mar 2023 22:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FCD82366
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=oVsXJemv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TYDvQlc2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kcda53rSeFy; Fri, 10 Mar 2023 22:04:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DE54C8235B;
	Fri, 10 Mar 2023 22:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE54C8235B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1479C008F;
	Fri, 10 Mar 2023 22:04:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA8EC0035
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38959408F9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38959408F9
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=oVsXJemv; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=TYDvQlc2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qw6uUeddiqYO
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3252B40A37
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3252B40A37
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 22:04:01 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ALhsfB029162; Fri, 10 Mar 2023 22:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=KVH9pm03Q6Azt5PUUff6BZXCDbbqSsE8WtbDkbQAvxw=;
 b=oVsXJemvFuHXgHQe+sg2BFO4bGa1k7QY1jfi5M+r+hj2u5gPGNRBc5tx8ce7mapCxFTg
 hAxJxVcx6+1olGxxqFzmr4S/Tjm7glG5xru+5jLDQafwFIeTSb6tRQ7pYz6Pgk6d/y3M
 4erwu3msxkURPvPr7E/LnRVNsyiAXOf+UdM0FIXzk0HXd/3Yrq1n8OixJdGj53W8T+3i
 snrLKtTpgYVzjbZ2mEGjAt+H3Y3nkloj52Rf4U64WG7bhnW91OqZtyl9JjWlFk9t+SAh
 tUE1pp2i5ws3Yf8tUGlJJJCQew1J1O1WnR8j2fd4KlkjIa7TD8XVqQgyuoBf6fL96AHz HQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415j6dfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:53 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32AM0mBl004846; Fri, 10 Mar 2023 22:03:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p6g4k82kf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 22:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwwGDkEhsHFWF84NSqmWxSbQF+Hfmin04Tg3bo66xvTja0LeGeKYinP3Nx+2Vhcz4nJFPa7HIvrfga3DYhgzUQjZQSdta7NnnhelZLzWSRONbmorwTRPm1KXQAOgZIKx6/pFXccYPt0bt3Punhtv1YjwNRQ8zOZTO9Ml0zR69gk/U0t2fScshhkYimpmvaShWQ3JCdYqYTCIjb5DwsQb933+2wxBceEL35Y0wCZp14qXjWyrHAe5xnY3tgzmJGCbog5AFWzAIaHP/HhHN4FRhjlNvyWom/WupbnY9EPeurRIG4D8bt0BpoOhNfY6/MZSHTuFQODCzC3gUOUSqbI4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVH9pm03Q6Azt5PUUff6BZXCDbbqSsE8WtbDkbQAvxw=;
 b=kBkkGiFx+Z/zUpK58hCz1MzZXn0GcPpLDOvEtArcxorhcJjFLhe2NLMPeIX5uKRidH48zAoYBg5BeAPJmprXS/5J3b00EBFJSxVPDGcyZV049dUChSbvJh+FZCcRZTftkiTzaVvWJ2PIu5f/6RBbqbT80QfToh1/5C+eR3QrWP96wUrJ+opea8bF2UJ6TXjHpJonBPIbMct6S1GmU/bZgRB/K8uS5ZR10z2I/GZNMamBsS6aKEN/buKYkK/bQfXf+tz5dmtwZnpgz7X0BxPBdcSKHv66JWz0ZOr93/zD8o5SK40tmmGP58BYXDk6d+k+BLyS4S+swsLN08sZRdAzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVH9pm03Q6Azt5PUUff6BZXCDbbqSsE8WtbDkbQAvxw=;
 b=TYDvQlc2kEu1gpJVU2UXYDqALKR4iOZFnB5ULAhvb5x56leGt9eec0UHzHVdbRfcB7aOI/YUYLfruepusdS3JoV3EhrFAmcg97Iw19JdiL1OaowNFUIJAEshWL+TwojZvHc0J+y3wRrXkrF2QvkA0UPGjvVxfOsaYTzbft+TuCM=
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 CY5PR10MB5940.namprd10.prod.outlook.com (2603:10b6:930:2b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 22:03:50 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 22:03:50 +0000
From: Mike Christie <michael.christie@oracle.com>
To: hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
 mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, brauner@kernel.org,
 ebiederm@xmission.com, torvalds@linux-foundation.org,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] vhost_task: Allow vhost layer to use copy_process
Date: Fri, 10 Mar 2023 16:03:30 -0600
Message-Id: <20230310220332.5309-10-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310220332.5309-1-michael.christie@oracle.com>
References: <20230310220332.5309-1-michael.christie@oracle.com>
X-ClientProxiedBy: DS7PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::17) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|CY5PR10MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f46ecb-f92b-45ef-116b-08db21b35474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4whzSpkPEsh99eWj34LoVqEL4mlO1xEOcDk6M48dsAgvgqx6EUFhyggsTaGO0U7lEuh8xIpW2yARF3FsCt7gTAZDnhVRu/qVJ6Bsqg4iH16dNYGaXzBMyzcWa7fw59UsNZ0MpKVAc3I3r1B7dwWoO4MLq6MgNCw+tQq0Mp7DNVDfYVuC0RPn1baiJgO7Z0uypl1A7/+MvpNY2vR47Bz/w47QTFr1Qn3CT3TCsqpwkWmtwTRZG5IgMW01WEu9oalzNjYeUHNXv4wdfExD9hRO8+wfa8IdUs80kr1M+pkMYhUSGcJg/g8aNLjBavAs13ChTdMkQk9OsOUX53WiTDFKy2+Rx+xMWrQZ5sYRirp+jCvugBNtTXb67R9JTSlAxkkrU9NSGLPan+nEUqbeLr7dGPi1FaKx+K3O1s8Z/LUKyBBE2ameyKMkinRXuRX/m+OQaHRa5An7yEHZ3nhThcptye078vbd9og+Da/t9Ip4akzWAId3LTf78F1VtEXcMarEYg824vGToegF1JIA1PT3iBIhh9TYRDNzTt5Z95WcC1u5inpK3GanbHiyhUgm43Zpeg+KfyCc+zgKu1mu0vWq+IyEpP/YExHJsmds50fQNxPekMv1ON+BWLR7zDCam1SuxHfslZ2n4XGqafdUndT4jxkKOwhuGVQaEMmrosWpjSk6LBHOoKEZfxTL0xIzv7h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199018)(36756003)(6666004)(83380400001)(478600001)(921005)(6506007)(316002)(38100700002)(2616005)(6486002)(6512007)(107886003)(26005)(186003)(1076003)(41300700001)(2906002)(7416002)(5660300002)(66476007)(8936002)(66946007)(8676002)(66556008)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WNpKKTDkYmD5ztujRfXFzqJ3KTJtNODnGkwV4qR2Ddt0OWRsmZRb3d20/0Gp?=
 =?us-ascii?Q?RyjbO2RtanZyqRcKvOP1Q5giOpffrrMBA9I5ThwQ/1pKTxVGTw7nQ6TXhTGg?=
 =?us-ascii?Q?gWSE4FbmE0YEEgE/nqifTZkT/WF6veDqBit6oQ4xKnTaqXNN7UHzAF/yU/J4?=
 =?us-ascii?Q?W20TrePqtGf5ZZBJIuK3RMyrvBx99XKpvS3dNnXpZx8hSVjf3faLLGvYaeP6?=
 =?us-ascii?Q?ufXnXHb2hBhY/l4qhwXhkWDGPqmWIDXHmoBsKTP9uTDCa6YeV+03gctxnt/e?=
 =?us-ascii?Q?vdNsMjIEyUYvDxoYwXbVxr+Q+h/WuqcWEXI+9SLLXG/edO5XfHzYD41Dnri2?=
 =?us-ascii?Q?/D9KylIu7LFsaxmv3CGAW27q940K5Qo4W1CEelDfLBd3i0xyzVVXITzb4cak?=
 =?us-ascii?Q?HD/DaSEWBPCHQgQWG72iUHtP8oTQK5GE3hIT7ESgA1viCLN/5Lh0SefLcDUU?=
 =?us-ascii?Q?7OOl9f+2ZwmVrTA9SJN/WhEIgNIMqVtStpudxJfUK+QCGaxAEYFV1puV3zcE?=
 =?us-ascii?Q?QlsAwGYDiJZN7yEaijIOuWQcr1FGoP8mwUMuzcJXKXeWbL+uOLokfOPjXfzD?=
 =?us-ascii?Q?InUDQa3AD2RUd/+0UIDPbH7TXI0D8kNV8/2ILE8gaT+EC2g8cvrNHJmBGjq5?=
 =?us-ascii?Q?FrSejiudR6hs/sBLFluoFqQygU8ot882QBB9zBkccgMfva+FKK9y+1WnWeXb?=
 =?us-ascii?Q?Ve/vw2s9yZ00+/I3xj6fzQ4VP6arCMkklEmPg5oFDirXR5ddGeQrzvTBeDZM?=
 =?us-ascii?Q?EKeQiT6sAvCLRQoNJbhyTCuGLogY9GpbZZGM0pTS1l0vGyFQmanksgFMiaEz?=
 =?us-ascii?Q?BzPzBnWHgKVwPJwbfxtGnCiCkwhDfq5h/5RaOUdUlrrUxmdQ2PNvX8+1P4DJ?=
 =?us-ascii?Q?cBfLewqowAx/86/dDl/+z1osWm+8pY3qJuAYQY2W8n0MZKxmR6VI9XvvtWFf?=
 =?us-ascii?Q?XoE73aJVWLyi8MMKe2QYhwKHFaaYsLROzeDC59PL+O9AL/tZmMGLewfMJdu7?=
 =?us-ascii?Q?APJ9aR17+DQyKIBilyiPJ6eNAXa/3o5RW3f7m9uXCH2be1/BdyTeFD6/RIoR?=
 =?us-ascii?Q?o4lzYaiint+IVlG0ujFNYaPtRc3vp5wfv9QrC5sXJBXhBNtJAyuwnZzS9P22?=
 =?us-ascii?Q?ufdrqTBnYiheb+fhq1Mly1vYEXxJ0RJbkQROSD2q1Xz+Q3HgrzLPFcWxJ0Se?=
 =?us-ascii?Q?g5gK6iu7zdPeDOQeJdiP8wFaqqAentZKoWnz4WfZ8ka+AkXaWM3c0l0t/oxs?=
 =?us-ascii?Q?YC/EiDCephEcuTcuJL1PTT3ipteb5bafoDEycJn6nqhRDPbME7by9t+0uJcA?=
 =?us-ascii?Q?/OjPBzsqLCNbdVD6tvMp2kL4Dm6I2vYzXXBp0m5wyMg2ooMVr/hKcN3nIWii?=
 =?us-ascii?Q?+amXQw8lyPj+pDrzF2sYuuYFGcwQuViI/f6ORLf/1hRY3OrAZ4wLRpVdeo37?=
 =?us-ascii?Q?hpfwQ1FvM6NGJnXFz9OQnpGV5EZSxrcuW3Jlki3fUkef0EnUzNX8Xp+XcgtB?=
 =?us-ascii?Q?k9/dTaV76SoStEfjIndU7o923b3YmJuPbSJZfSYcxKT8oM/IasNN6yPNGdTE?=
 =?us-ascii?Q?9K+6mHbq3zEzoFugLlfqrLueHs4RmaEtV/lseI70TQz0SLIkrB2au4hLqOwv?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?gqui7IhVJvzqKrlQitE5/DYW28sXYsbdOTOMskFTvsTbmVKdIARDUcHEZRYW?=
 =?us-ascii?Q?ElfWmvuB28s6ayg+1wJQXIIC0269gOURLKbgMdJ58vf9jvtwtInOghmWgLGk?=
 =?us-ascii?Q?x332X3z9WCHCzjDpM9jWP15wRvOGu+pD0T1Kyjfgxgcem+8sXvvPObgALjb/?=
 =?us-ascii?Q?Rl5obThj3p+aAqCe9lVhFr4U4v0/9pyOKSKEH/qrDY/0rrg/wp//9CsV8YeX?=
 =?us-ascii?Q?lClW73IqXTdM0Ls1YP2WJ+FUJOz9eQjqv1IpXdDYwATA9kQR++ClR9paXNH1?=
 =?us-ascii?Q?GbRZDljqq8Qe2n7Uqbzam7A4umuojk6fJ0y/vBo5+Jn4gM4K/4cr/CspDHXk?=
 =?us-ascii?Q?bA3+mUvtr1cl6lgVA6DJYnTPozxGaHIbmNVsmj+7WdMx8uBKZ0V+3MiROrtr?=
 =?us-ascii?Q?wdhRkeagV21JoPKk9ms39JOKsGTVJF5rZnRF9yzdgPMPy3zQWebRxwUMNwrZ?=
 =?us-ascii?Q?0sJR1g783QLChOVjjhAO5OKtlIWmaBC9xuxN9RzPDyj4nR+yULxBecfxvzC5?=
 =?us-ascii?Q?194e7W17qLA+mRVTB579la42hlHHzu4C+t5eqzPjvMgW62B9rr9tYjd3wQv+?=
 =?us-ascii?Q?1JbaGhYVgcVbF6jwSm76adY8crJWOUrThcpXswd5N/SqWV1UJWt22I6OQJpZ?=
 =?us-ascii?Q?FutPgbM2nqdXsXEP1JyMkugCZaj9OlgzdoXKzMoo5dUMzouRjCaNvbcdjHXt?=
 =?us-ascii?Q?apDVTLEknBFbpguicKJV9CHa8iasYzy6QNPEoT4+Kwto9cS7LM1q0tjX9qte?=
 =?us-ascii?Q?FAY1ofUh0yZIp67ndVFjtirwFFWB/0Vm2X39fCGj1QHQwEdYmlAGoMmey8dR?=
 =?us-ascii?Q?04q6trhERUOxuau5gO9U6ysdfzgOGAmy+BUbwbLdGPnNv7trX2mBL+aW9amM?=
 =?us-ascii?Q?R3WnOobb/IKG+XI88lujblgpT9N4eU+rfr1t4rfSDpjAYpXHBnEQpL71IG5Y?=
 =?us-ascii?Q?+eIcbckVVOibd4zX24Zylbiwlloz0+4XUf7cRbNAaPQ8iW92X3QyrZoq7KYi?=
 =?us-ascii?Q?9tmXe1NXzWUPGKtmnrbQlwFIhA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f46ecb-f92b-45ef-116b-08db21b35474
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 22:03:50.4687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOci8JAtWvMeYnTmtZlNz4cGZi1TzCvMiftnHtr/Ts7ST4HIjPreNMscZk8TlbVnQZs6WUDRar62j71C8FuAHe/eZ2ko8LEjtypzdbuWSWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5940
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100176
X-Proofpoint-GUID: pzM2GVyZMB36eefuDw9n4uMThZ46HLRU
X-Proofpoint-ORIG-GUID: pzM2GVyZMB36eefuDw9n4uMThZ46HLRU
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

Qemu will create vhost devices in the kernel which perform network, SCSI,
etc IO and management operations from worker threads created by the
kthread API. Because the kthread API does a copy_process on the kthreadd
thread, the vhost layer has to use kthread_use_mm to access the Qemu
thread's memory and cgroup_attach_task_all to add itself to the Qemu
thread's cgroups, and it bypasses the RLIMIT_NPROC limit which can result
in VMs creating more threads than the admin expected.

This patch adds a new struct vhost_task which can be used instead of
kthreads. They allow the vhost layer to use copy_process and inherit
the userspace process's mm and cgroups, the task is accounted for
under the userspace's nproc count and can be seen in its process tree,
and other features like namespaces work and are inherited by default.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS                      |   2 +
 drivers/vhost/Kconfig            |   5 ++
 include/linux/sched/vhost_task.h |  23 ++++++
 kernel/Makefile                  |   1 +
 kernel/vhost_task.c              | 117 +++++++++++++++++++++++++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 include/linux/sched/vhost_task.h
 create mode 100644 kernel/vhost_task.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 39ff1a717625..f379ec9209ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22130,7 +22130,9 @@ L:	virtualization@lists.linux-foundation.org
 L:	netdev@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
+F:	kernel/vhost_task.c
 F:	drivers/vhost/
+F:	include/linux/sched/vhost_task.h
 F:	include/linux/vhost_iotlb.h
 F:	include/uapi/linux/vhost.h
 
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 587fbae06182..b455d9ab6f3d 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -13,9 +13,14 @@ config VHOST_RING
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
 
+config VHOST_TASK
+	bool
+	default n
+
 config VHOST
 	tristate
 	select VHOST_IOTLB
+	select VHOST_TASK
 	help
 	  This option is selected by any driver which needs to access
 	  the core of vhost.
diff --git a/include/linux/sched/vhost_task.h b/include/linux/sched/vhost_task.h
new file mode 100644
index 000000000000..6123c10b99cf
--- /dev/null
+++ b/include/linux/sched/vhost_task.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_VHOST_TASK_H
+#define _LINUX_VHOST_TASK_H
+
+#include <linux/completion.h>
+
+struct task_struct;
+
+struct vhost_task {
+	int (*fn)(void *data);
+	void *data;
+	struct completion exited;
+	unsigned long flags;
+	struct task_struct *task;
+};
+
+struct vhost_task *vhost_task_create(int (*fn)(void *), void *arg,
+				     const char *name);
+void vhost_task_start(struct vhost_task *vtsk);
+void vhost_task_stop(struct vhost_task *vtsk);
+bool vhost_task_should_stop(struct vhost_task *vtsk);
+
+#endif
diff --git a/kernel/Makefile b/kernel/Makefile
index 10ef068f598d..6fc72b3afbde 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -15,6 +15,7 @@ obj-y     = fork.o exec_domain.o panic.o \
 obj-$(CONFIG_USERMODE_DRIVER) += usermode_driver.o
 obj-$(CONFIG_MODULES) += kmod.o
 obj-$(CONFIG_MULTIUSER) += groups.o
+obj-$(CONFIG_VHOST_TASK) += vhost_task.o
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace internal ftrace files
diff --git a/kernel/vhost_task.c b/kernel/vhost_task.c
new file mode 100644
index 000000000000..4b8aff160640
--- /dev/null
+++ b/kernel/vhost_task.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Oracle Corporation
+ */
+#include <linux/slab.h>
+#include <linux/completion.h>
+#include <linux/sched/task.h>
+#include <linux/sched/vhost_task.h>
+#include <linux/sched/signal.h>
+
+enum vhost_task_flags {
+	VHOST_TASK_FLAGS_STOP,
+};
+
+static int vhost_task_fn(void *data)
+{
+	struct vhost_task *vtsk = data;
+	int ret;
+
+	ret = vtsk->fn(vtsk->data);
+	complete(&vtsk->exited);
+	do_exit(ret);
+}
+
+/**
+ * vhost_task_stop - stop a vhost_task
+ * @vtsk: vhost_task to stop
+ *
+ * Callers must call vhost_task_should_stop and return from their worker
+ * function when it returns true;
+ */
+void vhost_task_stop(struct vhost_task *vtsk)
+{
+	pid_t pid = vtsk->task->pid;
+
+	set_bit(VHOST_TASK_FLAGS_STOP, &vtsk->flags);
+	wake_up_process(vtsk->task);
+	/*
+	 * Make sure vhost_task_fn is no longer accessing the vhost_task before
+	 * freeing it below. If userspace crashed or exited without closing,
+	 * then the vhost_task->task could already be marked dead so
+	 * kernel_wait will return early.
+	 */
+	wait_for_completion(&vtsk->exited);
+	/*
+	 * If we are just closing/removing a device and the parent process is
+	 * not exiting then reap the task.
+	 */
+	kernel_wait4(pid, NULL, __WCLONE, NULL);
+	kfree(vtsk);
+}
+EXPORT_SYMBOL_GPL(vhost_task_stop);
+
+/**
+ * vhost_task_should_stop - should the vhost task return from the work function
+ * @vtsk: vhost_task to stop
+ */
+bool vhost_task_should_stop(struct vhost_task *vtsk)
+{
+	return test_bit(VHOST_TASK_FLAGS_STOP, &vtsk->flags);
+}
+EXPORT_SYMBOL_GPL(vhost_task_should_stop);
+
+/**
+ * vhost_task_create - create a copy of a process to be used by the kernel
+ * @fn: thread stack
+ * @arg: data to be passed to fn
+ * @name: the thread's name
+ *
+ * This returns a specialized task for use by the vhost layer or NULL on
+ * failure. The returned task is inactive, and the caller must fire it up
+ * through vhost_task_start().
+ */
+struct vhost_task *vhost_task_create(int (*fn)(void *), void *arg,
+				     const char *name)
+{
+	struct kernel_clone_args args = {
+		.flags		= CLONE_FS | CLONE_UNTRACED | CLONE_VM,
+		.exit_signal	= 0,
+		.fn		= vhost_task_fn,
+		.name		= name,
+		.user_worker	= 1,
+		.no_files	= 1,
+		.ignore_signals	= 1,
+	};
+	struct vhost_task *vtsk;
+	struct task_struct *tsk;
+
+	vtsk = kzalloc(sizeof(*vtsk), GFP_KERNEL);
+	if (!vtsk)
+		return ERR_PTR(-ENOMEM);
+	init_completion(&vtsk->exited);
+	vtsk->data = arg;
+	vtsk->fn = fn;
+
+	args.fn_arg = vtsk;
+
+	tsk = copy_process(NULL, 0, NUMA_NO_NODE, &args);
+	if (IS_ERR(tsk)) {
+		kfree(vtsk);
+		return NULL;
+	}
+
+	vtsk->task = tsk;
+	return vtsk;
+}
+EXPORT_SYMBOL_GPL(vhost_task_create);
+
+/**
+ * vhost_task_start - start a vhost_task created with vhost_task_create
+ * @vtsk: vhost_task to wake up
+ */
+void vhost_task_start(struct vhost_task *vtsk)
+{
+	wake_up_new_task(vtsk->task);
+}
+EXPORT_SYMBOL_GPL(vhost_task_start);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
