Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1FE3169F9
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 16:20:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 192D786C2C;
	Wed, 10 Feb 2021 15:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gb05lIxGmrNS; Wed, 10 Feb 2021 15:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A7D386C32;
	Wed, 10 Feb 2021 15:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55293C013A;
	Wed, 10 Feb 2021 15:20:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF749C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DE3128689B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZ_9DSLJIuqq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE9978691C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:20:05 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11AFEJuO089072;
 Wed, 10 Feb 2021 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=eYt65we08HkJkq0B8joG2rT6XAJ/ro5P6IhRy01ldqg=;
 b=kV/PEKaDsfUZX2BMwyGfWkEoLXenCCez/WDV7jtsugVDeD87oH5hTXtlveoRfK/sdpIt
 DRgKjBTAP4QbaxP3OvIxpDzV6uclY5B6OnEeReAvNogFtomS6IgHdIMR1Nw1/sDAt3Qk
 5AVKV0WrZ0GYx635G/45WbU/ovdpxGBobgbGOOFzS5nMwu5FmW8tVM24F4/8crbh9fdI
 4KYOajRQfMZaBd4HMiNlCc0wKFgWR42LXZK0kdv1slHsVcdKNVGHFa5qoP7qcyO3MEf1
 HUePxj1gYsn+vaJmsW02+3dcEd6/FbB86sUsuwBcG/jx8mKuwXQsnGx+q8VvIYrl4+IQ UA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 36hgmakwkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 15:19:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11AFF3Ys070887;
 Wed, 10 Feb 2021 15:19:46 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2059.outbound.protection.outlook.com [104.47.38.59])
 by userp3030.oracle.com with ESMTP id 36j51xpw37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 15:19:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1K/3QfPVOv+fxyvz7+iTiIu+Q5HqUHSWvNPwQB9yG+WzuDMGyu20J6MNv6WRcABLGPJsI2O4JLQsRSQiHGZkY3g13moJ6hcC0DidPq30NohlFoRuVMnJg4n9GM3US9zXer+oJ6rcX+IjtxB9Uv9uKAmFnBqu2wwB+SS2+/cVWYL4t8RPO4v6crJxGtv9yLvyqwIbU+wDeUrmuRAjBf1oHB9nZByMZpKdzWwbJZgB6MZCuYFUgluUuEyyP8o9Wp+vKJCBG9fz5dJ7kiabcbsagOnD1qXjpdlolUweHOT4ACz1fAW/KMoae4JMocx+WNOroEdF/YLkht/zifYeXtBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYt65we08HkJkq0B8joG2rT6XAJ/ro5P6IhRy01ldqg=;
 b=OXyCl4tysmvj1l2IMU8CsKyf/vcp4q08ybIBbvHb+LJC37SNUyVqqvLvnnv4ug3nveYYn8vDFzfAXJnmU9xHcXI30U/vNabiEpBpSu+LFAhJ98P58mNwbyeknA4pPLJbRypRofjmM6rgUCfgy9bvdUt/aW/E3UxRuQYovcMtAuF8y3y9P3UzD6ITPFf3IbREbXPrH3sB71x4s8uOMlb/urqx/wPiboSfizGqxQYT4JXcUMhgGjMyd6bGyzEYeFts0bHE/Zzt6C4GARFI3R6b99+LkQ37QM8dyIMRQ94XMw/3xPT0nEY1k4d7ssLvmdyX3PQzQIMZbx1FNv01qB46/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYt65we08HkJkq0B8joG2rT6XAJ/ro5P6IhRy01ldqg=;
 b=IvzDOfIyjqRF/ns+iN5D3t/RsqYYI9EHFGC82m1ssP9lw6V6tDGY+i/nmdCccZQxYNcdjVwKp5odzkFhSAWUFK7BDmdK9bt7ySp6gW1ZGxTzLRchGKXk9z0iE6HHuR4DKu+TczW8FivSpvrwGps5kLGpD41zue/bj/oicm3jCo4=
Authentication-Results: 8bytes.org; dkim=none (message not signed)
 header.d=none;8bytes.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Wed, 10 Feb
 2021 15:19:44 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::e180:1ba2:d87:456%4]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 15:19:44 +0000
Date: Wed, 10 Feb 2021 10:19:38 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 0/7] x86/seves: Support 32-bit boot path and other updates
Message-ID: <20210210151938.GH358613@fedora>
References: <20210210102135.30667-1-joro@8bytes.org>
 <20210210145835.GE358613@fedora> <20210210151224.GC7302@8bytes.org>
Content-Disposition: inline
In-Reply-To: <20210210151224.GC7302@8bytes.org>
X-Originating-IP: [209.6.208.110]
X-ClientProxiedBy: MN2PR20CA0061.namprd20.prod.outlook.com
 (2603:10b6:208:235::30) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (209.6.208.110) by
 MN2PR20CA0061.namprd20.prod.outlook.com (2603:10b6:208:235::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Wed, 10 Feb 2021 15:19:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36fd0ec3-539b-4ba4-b076-08d8cdd74b6e
X-MS-TrafficTypeDiagnostic: BY5PR10MB4116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB41164582E8AED1E1B289E6B2898D9@BY5PR10MB4116.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+PZQDmTy5KELHRXDaocpTdsWudAAdXqJe4oDxIGCYjkkOYjcOw/kQy4MmaVVVYTS4L+Sp6dgRPNdVovwq7CATAUZfX/BAsr2TbwmOUUxyWZpbO9nTSMpeQwHWn3uqxIOmnGArAzTQDvT3KpjVei0TxaZOEFYXfneXfF6xZmpDmbMQvdrbLuKqrozJG3J12c2rLxHJJH0JI2tr5zuWRAnuMkcNgJJkfkWxX3G4zbmi/h3bW4noo677grCQS0do92NtoQCIrXlUpQxbUN06NdiSpH5uTkiyp4DqfYIX2mz+PSIBy+YJ/JeXYmDiMRlzdMBHJRl5ecU9OcBo1ecAatt+ue5F2zryqq9xb5HVyiY6vVrfEWEYy1rB9azN98WHEnQIZVApqgpF+lturNtB3HRydfkpsXqHbmq2tINJWFrqvx/ZkXMtAcCoRAPQx0qRVEPKIs7uHiOSvJdNv5L52rQ4CeDAPLD9vCXy6k4rOXf41RJVYF22bFCTfM6lqpgXDCqlGJa3OAIdCgR24nLB0yug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(9686003)(86362001)(6496006)(6666004)(4744005)(9576002)(52116002)(186003)(16526019)(83380400001)(478600001)(54906003)(6916009)(55016002)(8936002)(33656002)(33716001)(8676002)(7416002)(66476007)(956004)(66946007)(2906002)(66556008)(26005)(4326008)(316002)(5660300002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qz9Kc0tms8bvJRULstZa29XHc9LIrsO3RHxpUqL0NzhMMXRZDbyYeZ8qYEC/?=
 =?us-ascii?Q?YRonOkUIxAlo1iqlPT9s2tzZwbHIoVXH75knJOdqiV801FG7P8YUa/qjIQ9K?=
 =?us-ascii?Q?wjB1YuzRzxN9fNPxM8AMJXI+4QPRfs27pdRTl4Bid4tBVABDvxnDU6ERHmTX?=
 =?us-ascii?Q?1Zh6JCdSBqLRMbp0DKtmXwFBcs0Om0JEdJA033aGkr3dW+8NNHKyM9xZLPQo?=
 =?us-ascii?Q?yn/jz0QBtOlV3TRDYHZLWcWRn5zgPoekDCOV0HwyZbJi6zN66RYFM1nPmlG0?=
 =?us-ascii?Q?7CzLsJXJZO2x7wh1Mpxf7lzb7wqWypVDl2n+8HA87FaZ1qaFxrIQa8Mh+a1w?=
 =?us-ascii?Q?90NepD1Mup5+hUgAAPK4x2TqrhHmfDzqRfPH+34UlWOdqMwVsj6t6QHdGwqK?=
 =?us-ascii?Q?5G7GtyKOGxvysOFZIc8s2+K08vYFBLb2IsetjWT34M86XHdTDpX6nNnhdt7K?=
 =?us-ascii?Q?4TecfbuuVHImsP0NOnc49YsYI9v4Y09Bmy2VZ2uykI2sZj9g+AK1zVD1xvEz?=
 =?us-ascii?Q?F2vm9YaVV4p3uEnNnNChmLMqUoYP4ssyqmYs3Jtx4u9Yo6hK7boUSYYJ554z?=
 =?us-ascii?Q?8pj+MooC45FDU0qWimwNvtJllwWV/OoFiAPYSPCaTH8AMW8gNAt+Na/FR7gF?=
 =?us-ascii?Q?iyQbRJYeji+ejcaNs7qoCfGXVk6a3ygLqs0LQHIEuh0CeF4T4gkN+fq1h2ZU?=
 =?us-ascii?Q?EBxmf6XaNhRbXv32Fu2adqNRxxbPANNVvaqNeTjmsJ7vzWGUGp3Of/CtExEi?=
 =?us-ascii?Q?9VtlSLen6kgC/ykiCUVEjAJhvXSOvb9jWxkykiGXmCPt3Csi3WRb6Kp6LiCt?=
 =?us-ascii?Q?whHCGngHBQMWg1+eJUWjkOTobuRcypKNyHob+CZFo7koAOqzYeUPsm8hNXi7?=
 =?us-ascii?Q?dVSfJdeuuF69fG4J7M+t2XWXxxcsGb4D7YSI6tmorboZNYrxz1dRggeyMo1O?=
 =?us-ascii?Q?wlnw5HM/JqI7Y9YRhBhrIF4Q33ecXO7C7dpMUVMHx1qNaS4HTFVIBrimIUfx?=
 =?us-ascii?Q?fS8Rz1wWXwgxlkvlkjAPnGQrWAv8EdRwc84qAuwsWWsWX/CrS6oNFGDIvUWe?=
 =?us-ascii?Q?vExFDpsycEK8E83JAeM1Mw823k5M8LqDJt4GHwR5mXB8+vtY4sULE+z+oPoL?=
 =?us-ascii?Q?p3na4LVfevhl6aFZN/ODku2JlxwaMksfWeUEb56CENOZJY0D4UHGl0IYUc3z?=
 =?us-ascii?Q?fy1fcYurNaydu6/iKn7is7DWRp05Repx73ov7w/QSFLroEv9jmDGITss81Cg?=
 =?us-ascii?Q?fGDahT6TtGT2hdDOIW6JcoJNU6n0AyanKaEuujXIkDannnAcC8BYgI7b//Y1?=
 =?us-ascii?Q?u8h9Y7GIk8kBtn/z6hRZTsDx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fd0ec3-539b-4ba4-b076-08d8cdd74b6e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 15:19:44.1782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpYeIJsu1mAvDcaj0RPGyiDBnmh/oPC8m2valw0Mhjv0LX0zY5oRP+NEbDRLVXWRDMa2TM26XIKeTjD3rTv1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4116
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9890
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100146
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9890
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100146
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, daniel.kiper@oracle.com, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Wed, Feb 10, 2021 at 04:12:25PM +0100, Joerg Roedel wrote:
> Hi Konrad,
> 
> On Wed, Feb 10, 2021 at 09:58:35AM -0500, Konrad Rzeszutek Wilk wrote:
> > What GRUB versions are we talking about (CC-ing Daniel Kiper, who owns
> > GRUB).
> 
> I think this was about 32-bit GRUB builds used by distributions. I
> personally tested it with a kernel which has EFI support disabled, in
> this case the OVMF firmware will also boot into the startup_32 boot
> path.

I think I am missing something obvious here - but why would you want
EFI support disabled?

Or is the idea that "legacy" OSes can nicely run under AMD SEV?
But since you are having a kernel patch that is not "legacy OS" anymore.

> 
> > By 'some firmware' we talking SeaBIOS?
> 
> No, SeaBIOS is not supported for SEV-ES, only OVMF has handling for #VC
> so far.
> 
> Regards,
> 
> 	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
