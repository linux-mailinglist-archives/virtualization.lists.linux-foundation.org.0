Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7670B356
	for <lists.virtualization@lfdr.de>; Mon, 22 May 2023 04:51:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7E0417A2;
	Mon, 22 May 2023 02:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7E0417A2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=IwPc1puK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FtTHnHBo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4c6_bFtqar7v; Mon, 22 May 2023 02:51:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A5A0141770;
	Mon, 22 May 2023 02:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A0141770
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A8A5C0091;
	Mon, 22 May 2023 02:51:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE81C0035
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 May 2023 02:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 257318226F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 May 2023 02:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 257318226F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=IwPc1puK; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=FtTHnHBo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kGmDIiCL8ev
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 May 2023 02:51:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 839DC82212
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 839DC82212
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 May 2023 02:51:45 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34LNIuBn021870; Mon, 22 May 2023 02:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=CXhMrpVrSuQgfBgNzF+b1nwzhbgKXfbR4MPYGoE/VtE=;
 b=IwPc1puKTZ769U8Acx6f/TDJxDlXnLWwZy6oe54qaoaRERHPtRo/0Sk3A1GsY5NvxuVe
 0UHxhJZH5S0t9P5LeXpxanZqsMi5cYHhAzjm3RsNkJtzhiXPmw9GDQZzO2lO626mVDS1
 m9dlL3PP1P/ynhOD+9jPfTCNZAA1483xjmBJHKnRu60fHXRmc5cuUGrJA4k2sI/OKrtL
 7Mhpzp9wotGUf2ZU25wQlaw/R15B4MKptHDNY3hyHG+M33sKC+R2VLkwFYeUIMbBWjgz
 oL+1xg199aI0L4Dmux2ie4vwMneX+zNDuwam5Ks3zeN4fP2Q6VtPKjURqycssBs5TnrY pw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qpp3qhqq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 02:51:34 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34LNFeMU029094; Mon, 22 May 2023 02:51:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3qqk28vjqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 02:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnuK5sh5+MyXq47EBVZwYF4TXN0szfiUkU0lFN7eFunzjdpBlXIRk1FGR/NRlxlYZTg4K7srNezgTYDau8A0jDpRRWtVOIKsOxYuwlaiXE6lUsLJdCnJP7t7igFgbxE8xzUCsvipEGDqy+UYOub+pTS6WgIvlmcZ3eKCTDt+jmKhRFrgyiO1L8ziUh0cb5BcYnbenf2dPn2VlmExq1u4KXT5HlDmUaRT4MgQ18B2SQ2OwQ3g7P6F/A/dTn9+2O2zzJptQRapoX8VoqKmT4u27JtBG8Hm1XHyuqk/JUlYgvbgCmGipo2vBo+FkbJImHVjv+TlCdCmIadv/rTcOjy5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXhMrpVrSuQgfBgNzF+b1nwzhbgKXfbR4MPYGoE/VtE=;
 b=FOLQTlEo4S8GSO5ZIBDxsjROXOKKY/gnMTaRkEgRlnzdbF4Hr+LZhIuNc7PRY/oC2xyyS5Q8R7SvklaI1KJLLQmjb7xFV98VUFzAgE54wLtTfCIXg+XLa/hpqOQO4gVS+vEHaoYem5UOKCkrMzYCeNPGkwTs2V1EtseKriBVbe49R+wFLv4VVX7tlKVFos1l5XwH2QewIzUb5lU/JHcHtEjp1mCmXqlLP976GBS3TTb3L+y4DBwm9XPUvmowPnO1Ct/2LifIRCHy1W4Vs4Vx+IB7iyBCE0YCNPa9K9E1mOuE4lufhM9kIUIY+Du5x/emghzVUREeAT3ZR+12nsipzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXhMrpVrSuQgfBgNzF+b1nwzhbgKXfbR4MPYGoE/VtE=;
 b=FtTHnHBo4LQUKVg0Ss3D/7hcF5C5xi4bcF2qPuNAJ308a0qxuI4odeFia9KlOTG0nXxvTQFkQ2AQzL1GSWuO+S5qmoy5KF2au9mKQwTRDlPbze4a3i7NPA/3a3nxULnO+nTUwPvz64RG+FAbQSu6K80ZnQn8u7uHx+ILZNlDPU8=
Received: from IA0PR10MB7255.namprd10.prod.outlook.com (2603:10b6:208:40c::10)
 by DS7PR10MB7324.namprd10.prod.outlook.com (2603:10b6:8:ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Mon, 22 May
 2023 02:51:27 +0000
Received: from IA0PR10MB7255.namprd10.prod.outlook.com
 ([fe80::6f12:fcdf:da87:2bfe]) by IA0PR10MB7255.namprd10.prod.outlook.com
 ([fe80::6f12:fcdf:da87:2bfe%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 02:51:27 +0000
From: Mike Christie <michael.christie@oracle.com>
To: oleg@redhat.com, linux@leemhuis.info, nicolas.dichtel@6wind.com,
 axboe@kernel.dk, ebiederm@xmission.com, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mst@redhat.com,
 sgarzare@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 brauner@kernel.org
Subject: [PATCH 0/3] vhost: Fix freezer/ps regressions
Date: Sun, 21 May 2023 21:51:21 -0500
Message-Id: <20230522025124.5863-1-michael.christie@oracle.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: CH2PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:610:38::43) To IA0PR10MB7255.namprd10.prod.outlook.com
 (2603:10b6:208:40c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7255:EE_|DS7PR10MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 773c6529-0b13-4554-eb31-08db5a6f701f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1GTD7R0PW8h1pxONZJHHLJICoZSBE5hsM1r+gDLsBv96Rhf8XxM9LcaCkwv9CrKu3b2Zi+dZ2BuUxwNfBdH0xg5afZj/nHISCTmnLUsm4LxbrUQPdNQMVwRd7s/hmxIg54KeyVIJ/xitNiTB83vTpcmBsyx6Rb60TuRFG+np2w2wPky3Nm16F1RCrZW6xtZC13jT8bd8hSyXkEqXjHqwW0FQEu4jhG9JN8stI5TjcGUoGiqFUgSCm9rgPYKHNTW6D1cr4+sbBfLUb0OBWxk7sSFPibvbU5Y3Ka7gvgRmkMYRdFWQBZCFSiYvWArvYPRORrF9YhbWVnwWkhTnvfXIANEB+oWLduCJ0M7o5mpv55dbB7KBmo1AHlFsYiHRxPaM+jKLxFRpwK+2x2xZRDu1VqmSdXCNq4HWppZ8h0BJq+v5KkgcG1yU/bjs3eCDzqquQKBlcDZ0WzBuzm72yxPO49pLbc3XTHMqfG0+yWR9uO88NN8TP6lIX7nFzBac2CuoQ1dB41HUlSXW5qtvh49T3V6MS2Ltfy8KZxLYyL/5bCgx/+6LJQqi9+jXf4mmM/aj+OrMR/ji2CwKFhJdHrSp5/pdCScor34zxO83rxtrcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR10MB7255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(6666004)(316002)(478600001)(6506007)(6512007)(1076003)(26005)(41300700001)(66946007)(66476007)(66556008)(6486002)(8676002)(8936002)(5660300002)(7416002)(86362001)(2906002)(4744005)(83380400001)(921005)(38100700002)(186003)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ES24uKgkYrka7yjQXb0pWVlkQy4q0YT6rGWAEXNwmhgDOVBQcyCGDcvzgFh7?=
 =?us-ascii?Q?xL5ReGLfSVmRU28ce5hoRkLVH3qKHEjnjeJmrghc0+W4ktx3o7qQ2OR/7T90?=
 =?us-ascii?Q?DRN36Mj+kZOsefyUnnyR16IIaFYZXL5p32lHzainml6wpXfVDxt/LdN6Wh9b?=
 =?us-ascii?Q?LCZJHyIpiNlsGfYKoMxQzrIVvcCHyqJMFo7bNFujEsswXQ6S1wR6EDQSzvw7?=
 =?us-ascii?Q?yQNd6sZYVTTSLGrgTfnh/0dfSF3E7ZrASlYMtFcirKBO75mAlM0SJru1Sk5i?=
 =?us-ascii?Q?Fn+aD8VoL6R2MkxYnf2Nky9MIRx0bkTcb1lwWDc8uojSObVJhZkdFQnrgG7Z?=
 =?us-ascii?Q?AG6oBR3b2BfiyveHk7V2CHE7tUjhV7jDZ0JlrB6M9QEQsEMkdsVhYuX1fHZp?=
 =?us-ascii?Q?giZu9o2O5+QqFcAIsDbebQN+ik+yQ2tDBFyQty80kuvJEH9PYrD8bh1pQlgN?=
 =?us-ascii?Q?XbHiRjmj1qKX38P2c0oOAWZ1JWwf5cH30+rUjnAO9S1vxk/kRpqzrn0Oawyl?=
 =?us-ascii?Q?umceIgSMlG1dBiLjjot5Nw20q/swUbad1qR05+02QOOMDziI0y8ag2TQsqlT?=
 =?us-ascii?Q?uuaCEhxVFKN4tC7NYt4JrnNTu/VZdhNTiIh4FgJ+XCEGJzJ9b9by0SW2msKe?=
 =?us-ascii?Q?MDZkz2QN2ASV340wrU5t4GdYKm1rCnrEtU6gr53MACFbPb3O4dt7gP9UbReM?=
 =?us-ascii?Q?ore1MjYdkidm7rv0PS3Wej7q1hnORHLgFlwdbN/wrPF1WE9pPZUwCseALyBS?=
 =?us-ascii?Q?DuJkrntPc1PLFIe9cq7HFa6ZtfkXukB5OWBHV7DTz9Ya6F15vQgDdZf7ZhqK?=
 =?us-ascii?Q?6v9oHRBQzGEdl4yp4+EYAj+9hLSwOx4645XMrzllRoF+i+/CSktF1LoCNCg7?=
 =?us-ascii?Q?aARoHZ9xIx2D2xKKhTqUF4Vp1M7Qa4kggA3e1c++t4ozN7yOJwPKEGHKsLtr?=
 =?us-ascii?Q?TU2YixVPTcOvOortKV2u+HVKknfxzSEsrTtPhRZlzKVzuISQji1FJcr2cTkU?=
 =?us-ascii?Q?BX0v8CocIFzfouX3BMCcTfN6QXGmVIbFSVy4qXrISII9fpolPY/8MBopeH4B?=
 =?us-ascii?Q?FkDeIw89ruu7pux5SCVyAdW3QwJJU8oO/sl843BOh023zO3rPqT4r8b+naZq?=
 =?us-ascii?Q?mnWtOVAEksoyrMh8aaVcVBZbLWmbvNTASKjovX948ynNHWSCRyuGi/5hWDrD?=
 =?us-ascii?Q?1sgAhrp0LYv/yzjTw5Bdq/Kh/+eIkFea6JdcuhUhAVTO8kBVNMgOz+rx3+Cz?=
 =?us-ascii?Q?v3qmst2vVZ/GavmYBrRSeo6Z4tctFFa1w86+6rQMlOC/mJQd/oUO3CI6rVJ5?=
 =?us-ascii?Q?ABRqoXCzTZl2lV6AAM5i7KZbra6TFKz/WTmnYYVdZKfptdUVSN0U9ENhszWF?=
 =?us-ascii?Q?GTGyG0pQOnmXv8XT86yNWjH9d7Dg10Z6y3qUSTod9Wz8kRscl7kNkQi9Y1zo?=
 =?us-ascii?Q?ifi6+Z/VhStUoh+V7RAsvx8ZuC1WbXy74wX1BOBrmQVzZeWnwmQX6zSFOBgd?=
 =?us-ascii?Q?EuqKmX/vtD1LXCZQ5KBHyOGsA3GzsE+1xGnF6sIgEb0peB4mgyBDaQ7Ha9tk?=
 =?us-ascii?Q?3aiCJ15v7yG4jiiekjofIGEfBUzSjMxcXHtPi1fshpzzyek5oO/S2SuvsxAi?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?TVAB36iY1b58uUt4s5YPSAdtdxgCdkMnQnm385KvyObrLGuFGmqf22ftl9uJ?=
 =?us-ascii?Q?V+P1XlMd+WYISUOFgR/w036ef8z+CX6KG67ISUq5bO7sHNk+b3VN2YAP1Ey8?=
 =?us-ascii?Q?TtBfQD9ylmMm7Pd+KIKtEx7wKiNL6e0frBTM1hwXRI5JU4NooKCjeU0oTydF?=
 =?us-ascii?Q?6JvZXtPGq1q8d5CABxCUvC2IS4zZ5b4LdG7GLmFke0KkbYconH5JEmX2+6pZ?=
 =?us-ascii?Q?bu+OHIJ8cH0s67+DHrAWc9zIiFH7FjeXC3Vtw4I70xP0ApMB4A0gjorO69a5?=
 =?us-ascii?Q?IUxjssT7TPDZEzRxif92U0quNFingC/UhO40aOrobOG1A5/9vnCkIgCJbWO1?=
 =?us-ascii?Q?WKK+yxZM+eBpUsJmjGeOa9IQ99gA1nOTcEQU2UrznFl0nGbAbOOPkLIbkF+U?=
 =?us-ascii?Q?QNAgak90DtM9QqKiuC17PESbzJyDN6EJmy35ufXsttW2bGsazRYatgvUVcUT?=
 =?us-ascii?Q?h/GXgnQKjgjTHmisnNkLfjMqEwxOiddgoIQUKHtGcWvCMp/IEZzods029IF2?=
 =?us-ascii?Q?3nPKIVKxpRZMhgsUvQ+c43s1vGvbB5Wuy4jUsxJ7bhpNPgX8LrJPOOQmoilP?=
 =?us-ascii?Q?1mSB2zOVh88/T6qD6k9yXPwnTjF+TP09a6sK7gumKTTjIn9c+D+mGHibYCmW?=
 =?us-ascii?Q?+Dx4Am+dDvie2KCPPsNHGDsa64mUXW4axpK1h1o4DdpB2cS1zFEKSibnaqcL?=
 =?us-ascii?Q?Wnh5DWnNh/8E5F/YYHZlAWonmp3RyBT9YJUjgLYkGbnAKL015vFyAmMLY37I?=
 =?us-ascii?Q?NJC6zmnjJMUIMZnZWESdAXcs8/fUSGoVuc6dbuaeIA8bq6L+uo6pb7IYetFA?=
 =?us-ascii?Q?57cy7I39sfCdNhng75G88+c8inrjrq5+hROdSQ1QMaCklLAx6iRyrKFjxwAf?=
 =?us-ascii?Q?RJal9ZgFMF8CiJq0gDGm5wqc5sW1nguk1r4dVVstYDwGxHHSMdoEuXQJLiXB?=
 =?us-ascii?Q?PUROmEEVHhi/55EHU7OP4mTSL3PwRgPIcOWfs8tk6DYRTvBhjYTPUdkBFQq5?=
 =?us-ascii?Q?zmlLCZAXzm2jTIHD+X6dlYiSwKZrWfauQeDKHDziELLAh5gnNAH4+Sadkrv4?=
 =?us-ascii?Q?KAhIY0tx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773c6529-0b13-4554-eb31-08db5a6f701f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 02:51:27.3739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WRO3Ldd9eiBknEjaLEJ1aZgGldfwJyHnLbGxp824d+38Pnu0ZMh+prc31mXf2r5KBoXSZnEQGdqum3czckT9Vd/DC6dQoObc5iNNMt/K9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-21_18,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=589 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220022
X-Proofpoint-GUID: DTbtd-qQzAoaibE0Sty3_isgQ4nEIgM1
X-Proofpoint-ORIG-GUID: DTbtd-qQzAoaibE0Sty3_isgQ4nEIgM1
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

The following patches made over Linus's tree fix the 2 bugs:

1. vhost worker task shows up as a process forked from the parent
that did VHOST_SET_OWNER ioctl instead of a process under root/kthreadd.
This was causing breaking scripts.
2. vhost_tasks didn't disable or add support for freeze requests.

The following patches fix these issues by making the vhost_task task
a thread under the process that did the VHOST_SET_OWNER and uses
get_signal() to handle freeze and SIGSTOP/KILL signals which is required
when using CLONE_THREAD (really CLONE_THREAD requires CLONE_SIGHAND
which requires SIGKILL/STOP to be supported).


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
