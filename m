Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id DB16C4BF55A
	for <lists.virtualization@lfdr.de>; Tue, 22 Feb 2022 11:06:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1F6607BC;
	Tue, 22 Feb 2022 10:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIpoM_J6QFPy; Tue, 22 Feb 2022 10:06:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 40587606FF;
	Tue, 22 Feb 2022 10:06:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2DA4C0073;
	Tue, 22 Feb 2022 10:06:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8082C0011
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 10:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 878C4402E2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="llN0RRbt";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="gordWc3r"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58A8PgQjNRWK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 10:06:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E46E402E1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 10:06:23 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21M9lAgf014977; 
 Tue, 22 Feb 2022 10:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=8/hrRoganNJs6Gjak5/KUv3Jv++H3HSoYkONtjYh9Fs=;
 b=llN0RRbtBsM5kDdbKWW1p7pwvVgXVoXb36Cl+p91bTkHEy225CYRqcFN66uMLF2AIZdW
 eMDgECGjgKzTeKXeGGfEw5ReZUpMurafHa535Xs6gYluld9u2s7eqYAFjnfu4pWokQlr
 Ohm+4+sO6j20IAkviHOqwGJzpi6cq49TDNNIdHXddjP0sh1SR/RGKk9rUfxgawD/U1zP
 XiSnC65U7ewRnpg9eTFYfJSKcPZViwXIfrckcW9v12PzfVq6zgSEvsEQ5nf0oFbIpiZC
 Afx+TsKr4J9LgxZwmvSLnJdNbaWLNePrbX4jxGhUL6+iw5BOJGqElYkechrd6klfdB54 iw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ect3cgmtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 10:06:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21MA0qmE030770;
 Tue, 22 Feb 2022 10:06:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by aserp3030.oracle.com with ESMTP id 3eapkfn1m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 10:06:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHB2bLD71h1fAQlkgnS7snSbopLKCfGkcJ6/0MRcUTpSrcNwlqINt/0Y3ZU+6F78oSyfJQ3qunCMJwBsEPLqoDC7kpai4uZKbvkVi27AM91h3L6xm9oVr7rqXnHuXIK3msZb/BFJIKvdSxyhl0RUiZCMY6IsxvkFi1s0PwjJ1wku9WIAI3+2Qa4iD8t6FKY9/RF59Rxkdm1BSocfG4ef22/j3xKwc46ZRHrsacXu7TAQVbgyuuGsy/7Y3suVmYd3AlV21iPy0PwTcc6P8TGUWz5oxHPMYWJ7rkF6Y288Wa/HciVpHRGZZbWHPRvMIWw6tYvSH5Vx7IubCmAUxYUUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/hrRoganNJs6Gjak5/KUv3Jv++H3HSoYkONtjYh9Fs=;
 b=hjwN9s1MCx84o8V5p/Bs8cHITNNQHhNYHvFHe5LHkWmDbf80Z9NJPLnZkfA6NEBD0B848WC4sQaGRfSnZcVkx0a44JiT+m4GcL4ix642JIkA/67iyOU9afGI3Nl3Bmqy6nJ3fkf7kbijAnO7UVql7G9RPuMNGntcth9dY2b5jvpx+T2PAEq+5WAbjrChFuz5rqRCHForCrzmp3w8AOI6hYICEPjil9anrvW01SsLy7pwkZmoHyOmPAvTTuJywoDEpWQ48IOtyA2WP7o04TCMUXyqXJBJLV0wcJ+MePK/CM/L0E3iTRM6ratx5rJrd1XaqCCODmmUK2ZeLJ92nRY0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/hrRoganNJs6Gjak5/KUv3Jv++H3HSoYkONtjYh9Fs=;
 b=gordWc3roi8ovf8Fg8/NQzpBlAze2h6Y5is7d0Jn7CKdkhMk1OKanep/hkd5qjaYynE+noXzgVvQSqF680PFfPW+8qUlkGS4KGiKH8+rmk0uk8ULOLo/otJKUC3FEKx5UtKFbnKu1jglijDy+VmXGGEvh4Y0Jfp6RgOAnoSMqfI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB4259.namprd10.prod.outlook.com
 (2603:10b6:a03:212::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 10:06:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 10:06:15 +0000
Date: Tue, 22 Feb 2022 13:05:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [syzbot] INFO: task hung in vhost_work_dev_flush
Message-ID: <20220222100556.GM3965@kadam>
References: <00000000000057702a05d8532b18@google.com>
 <CAGxU2F4nGWxG0wymrDZzd8Hwhm2=8syuEB3fLMd+t7bbN7qWrQ@mail.gmail.com>
 <YhO1YL0A6OjtXmIy@anirudhrb.com>
Content-Disposition: inline
In-Reply-To: <YhO1YL0A6OjtXmIy@anirudhrb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::9)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 043e446e-c799-4986-feb8-08d9f5eaf5cc
X-MS-TrafficTypeDiagnostic: BY5PR10MB4259:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB42599E6C8BCD9807F834B1228E3B9@BY5PR10MB4259.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/+nVKhVwPt+3mc6Pxdt/hvNZnHahiAf3NTws7pnwPsKK4ZMkP/MubwTNn1OZasp+9e7vcJQAMEJytByxPgiuaMHDMNotQot7LM6vp8zFmnrjane2u7SCLxZfh/8emqyI59IW74g8kuAotO+UVgbD6Y/hbCsyy4wlJShp3gb2gr6z6QvYinw/mCupKerI7rfe6Ow6MdJdOPn8MJXoBzVXJ9TrwRxCJDeN5tN8AFl9uGYl+XjA1/EqTHnzmQkAvbr627MoZVnEC3d4RAgME56JE4+lhyaln4V/8l7OZOKnwtkdO/uvEsNDyMrhATslQpFz4XxwevOEhRzcIMranXAGwCPIMjWL1B0yu1BO8mU2P/pBizg8QdcRnAarRzl3MIjcYPQeR/IfGyCLPCUl2VlnxuwqI53mUTIkzE21A3oQGMirD0q253XTvCatzjy2ekCVnS6NB82SHwHV19fWGkshr2wd0MYCLmwuFnHCo9pc5V0zIt/Dlcyba0M2JvsIA/idVHLx2vHhGAelTdBEDXaCfJu+E6EeDxseHNuTBCtQmynGYUsaSMVha7rGJv153hslSmHP9ZPejUIEykfC7/QA82amt61ul1vBr455J29NonU6gIZtdYPyP8JyiSEu6HjPLeFx1K/YOdxWUEBqpX4RBtg08DPeORbMyWhx+4w4S/3mlFfeTr7RPnXgVjuwR1yLnzzc6kQbpzm3NQtm9/UCgvNmJk5+PZVzCTaz4FhECLHxlAsYaRMoNK8kWeh2OSQZUMi2oBRPKARUOKCgH5puhJslE1T/xpobfmMdLp4ol49QgImeWWG6te2n2mIWAyAr/fElgRy9by69386zEr9kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38350700002)(38100700002)(4744005)(7416002)(44832011)(2906002)(33656002)(8936002)(5660300002)(9686003)(6512007)(6506007)(52116002)(1076003)(54906003)(316002)(6916009)(966005)(6486002)(508600001)(86362001)(33716001)(6666004)(8676002)(4326008)(26005)(186003)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tE12WDXtEnAjEg7ZcQZEC4IA5njNSLblU8+bAVvRlHfG3Q96YjrSvuxFdT/d?=
 =?us-ascii?Q?MajVB6WRod/TO1XbCsXv7yL7OWyD4vxU7pXSK7igV9sEXwzloklLn1lnm127?=
 =?us-ascii?Q?T5xMpMEkXY9KJt6RQi0hiom6PZHbLp6kJYERrHShBTvZsPehzqYf3DvLmC98?=
 =?us-ascii?Q?EfZdINz7vUMRD7ixrA0WS3EFAmO76U6c93gMGJx8s6EZgqdJADBIn4V3JuiW?=
 =?us-ascii?Q?tzNzDgqVcrhyP4sBcwXmX+sbgodY/x1XEj8931wzOLkG3VmohyfBseCpka9Z?=
 =?us-ascii?Q?V0x4/Jz6HRBoXdLdZLt+fNsabbPvwfWeZT/6BB/rWw+GK9y7ftr64SpRJrY1?=
 =?us-ascii?Q?71WQudDfOOO35beEnhJ34j3TTDK8qeRoI9/0T2bM3a9JMRI/kAYr2o1IrBtb?=
 =?us-ascii?Q?24onwdie+2uJInMx9J8Y5NF2BqjG09bfQMO1YnhGvGxoJLUqDR7AKEG67dOs?=
 =?us-ascii?Q?KdV2SiZMk4fbDTdiUDj/PbXBp+YCm2pFvfRlLKapPyMFCNSWBfaB5WCdbfwZ?=
 =?us-ascii?Q?eyvcfihuxRiGKJ2EioLGbdfpccmA8fm3nwAXFVTwehhq67luCOTIAYw/OkHL?=
 =?us-ascii?Q?N77j8r+L+4FawxPQU3gM5LTSyYJWyEEhScRYkxHuKd/tJH4voXF+p3PWsz/7?=
 =?us-ascii?Q?AZTEC0cqzYrYo+L7PpTwt4cl0rHhZ/bD2YKey1pMpNKl4BT8e6QwwOJ13JFF?=
 =?us-ascii?Q?C/Be6FU3KuEQdtZ5dyT2nO+vYKwa8PbRDNFYEz5S0AzG/o83XQK3skitUXWh?=
 =?us-ascii?Q?j74y2TzxKISm7+oNxh2OuNqABUsh07oLExdVVKYZSFrCqMBCjyjGlYMxV77r?=
 =?us-ascii?Q?fSPj6zdSYTk++vfV4aKGBKyR6IrpDhgNKOeCW6INX9iFsA4DHFttJtynqX/f?=
 =?us-ascii?Q?x30kLcxE07FnVxX+x+p4gNIkDNiSmfoikGMBQAQ9IF+tzJI0IRrb5HZ0JzWe?=
 =?us-ascii?Q?Qtn/oRdLuLSQ8SkiCvJYPngcbKl9Q4QS7f18SOiHpJe6oFWoW/cfkp97QFjn?=
 =?us-ascii?Q?sWFeU7hqSbqI25vzaAwOgeOhZRpM4x6OzXjwDug6YrLBZ0fNe+D2pm02UMN1?=
 =?us-ascii?Q?WQmcOl1lRbVbZ20O4wjo/SMx+GkxwiuB7Hut+7CU5BICu9VF8BpI4n7ofNtV?=
 =?us-ascii?Q?bEXkQLvx+9s7DZfq18yVsuZ8S/mXqY4IIhUOZ0b5DlZHecQHdvjNnV94A+pC?=
 =?us-ascii?Q?BrhXu0q/9epvGsaQiCBXyR95UaIzscv9EB2GOyx9CmvtHlQcSYfnPt0/lTJn?=
 =?us-ascii?Q?Fwbhg+pv3bi5DklGtdixYbhK175p4O00RtE1AWxsTNXAamtel1jZ00fOdNGp?=
 =?us-ascii?Q?jmn7J/xkWUD+EK+DP3a8V44mzRU+6LJ14CJMj9KJsyrL7nLeBKLNJQXkuAvz?=
 =?us-ascii?Q?r983W0nuZOK3QdP+qtnpZkYWFBafc/4PTS9CJmkkzV3kGp3aq/JBepGVo2th?=
 =?us-ascii?Q?DCRIR857xncM3w/MDKOGN/EVbFzBuYksHYJHpe+9X43aPJzHTe+75yiPSkRt?=
 =?us-ascii?Q?Cwen7RJUiK/2ezYQiJXYphUgZkCUn3qYyIRY04DxrTHYXQnBfNSPaB2HC2Ai?=
 =?us-ascii?Q?gIVHw5qxLS2QDpWppfr7qT6iv0NSyX4uuLXoLMrCxmAoFeB4jYeECsu3ZqTz?=
 =?us-ascii?Q?MjZUlVN/hYM29kSa2TCX30v/L86JA82EcNzkiENg7H7qLHrKneEj4OteOolT?=
 =?us-ascii?Q?M11p4w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043e446e-c799-4986-feb8-08d9f5eaf5cc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 10:06:15.0421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SK1atSUoU/eqNVx+pOw6fNuQqSLBOhV2ZzOiGdKRjA9ZxGrfLu+JFk5H2wqu72jf4nxGcpFFrzvSsMKrXcJNbUvTInM5D4MyqhXkc+iNR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4259
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10265
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202220058
X-Proofpoint-ORIG-GUID: gsk5fkzTxHrQiUkqOgYHrsDue7DJbAwc
X-Proofpoint-GUID: gsk5fkzTxHrQiUkqOgYHrsDue7DJbAwc
Cc: kvm <kvm@vger.kernel.org>, Michael Tsirkin <mst@redhat.com>,
 netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 kernel list <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 syzbot <syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com>
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

On Mon, Feb 21, 2022 at 09:23:04PM +0530, Anirudh Rayabharam wrote:
> On Mon, Feb 21, 2022 at 03:12:33PM +0100, Stefano Garzarella wrote:
> > #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> > f71077a4d84b
> > 
> > Patch sent upstream:
> > https://lore.kernel.org/virtualization/20220221114916.107045-1-sgarzare@redhat.com/T/#u
> 
> I don't see how your patch fixes this issue. It looks unrelated. It is
> surprising that syzbot is happy with it.
> 
> I have sent a patch for this issue here:
> https://lore.kernel.org/lkml/20220221072852.31820-1-mail@anirudhrb.com/

I wasted so much time trying to figure out what this patch fixes.  :P

(It doesn't fix anything).

regards,
dan carpenter

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
