Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146D39AA5D
	for <lists.virtualization@lfdr.de>; Thu,  3 Jun 2021 20:45:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDBC405E6;
	Thu,  3 Jun 2021 18:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V642bk52jWDx; Thu,  3 Jun 2021 18:45:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368C0404FE;
	Thu,  3 Jun 2021 18:45:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B258C001C;
	Thu,  3 Jun 2021 18:45:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69CD1C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 18:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5056B606FA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 18:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com header.b="yu0Hfne1";
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.b="ue6DyFAG"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwbTokYm8_gg
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 18:45:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7022A60676
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 18:45:46 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153IdIwB017254;
 Thu, 3 Jun 2021 18:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Rx9o0Anjy6NkQu8b70lumSlIKpopo36wJ5r+oqevfNk=;
 b=yu0Hfne1W79Wjn6Vwoq8e99qozA4EGKLZiCp2lsAxumgZMUHP0OqgQ34JjsYRlPzO2GU
 QxpXivfc2osPTuYUsXAzSsYygPL7wpC5ROJhjzJLy1dRcXF11Zsx7vBW6rvyrDMefX5E
 AKWW/GkofNBgkyIljYTr0rGv0vYuFXQ+17E0TMGWNIKGrvB40qwjNzmbPPvjtFuc6zvo
 j0udZBf3u41yQnDbAAWlqUSM6sMeR+roblKUel0AKF34k8zkHePVkpb2A+PEZw/bE7z6
 ZqqJBbFwNGs3XrmlIErDz0CWcRzXJ48d5b8dd5hB4GV53BPxLfnpO9qn/LOyNthep1uQ 0g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 38ub4cv7u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 18:45:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153IfTuO150668;
 Thu, 3 Jun 2021 18:45:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3020.oracle.com with ESMTP id 38xyn18uu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Jun 2021 18:45:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQ9nx/fGMMiIHd2Kegc8uq9XEQITrBRFFD8pKmMybF/gcmWwh2tNjZVMc+29jGesz3DKj19DGpVIvHRCF5yuRvTHM06Mnq3kimLn6Ar5hDdGv9awIFwv7oEMJFmbEFFlSD96Ttgo3JSzUW3/Ux93G/PqJCGLedeVu5Yq/GrfZCDV/7njb3Cbtq5oXDOdoT7c/vHkZnvp6MRl1Hi/gP41vKlDvvY9f1WIHXqR8cn2YOiXdT6KU6LNGL5EiTY2OfGx4mo1T3EleST5BifZEieefGLjly+FW6pfk5HInM5zo8hR3Lz7IfJXHlReyf0qVlIUBtEO1ZUaGTwXVzO5uJxHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx9o0Anjy6NkQu8b70lumSlIKpopo36wJ5r+oqevfNk=;
 b=g433BFL7oxR4m33Ym6BEP2+hESQ6d2LJCJhQc3AxNQ2PZdE0t/yBKdek/p3Bg2+DKv4pzHr98F5ROEvTR2WzAb9zO0TyXaXbzl8PXpyvYdNIuFj8ins+6o2Dw1ssfzrm/A/sZgeNfPod8IfW5nxOqjOea/QfdnAsIs6JINYu50Q4PHhMN/0tPHHdzgnCXqgtYAbRpN4M7hARSGwG+XlgImnL+qHwyBIZT4lNSvYJyw7MDpnbuKv4MPWuqjG6gnnnbwBLb8uDZUk7/+uz13KMX8pbwySfdBE8oJD1vLamvnOAMLNJvxB4sI/JcrNiXGdWiN1QR0tjemDXkRRDLv1j5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx9o0Anjy6NkQu8b70lumSlIKpopo36wJ5r+oqevfNk=;
 b=ue6DyFAGx2S503icIuYFMD83jjvmshFgs80sXo0cPwMX8vya4h1tABc/puuLbJAI3DQ/UYGoKfo7NyJk4I9HTpBhQoXyynib4u2Wx2ZF4PdccXDE6HHtG73Z1oMBZPANjls4Y1+UWxcksHokAVtdIlY3X6mVMZdpN0Se0xm4tik=
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from BYAPR10MB3573.namprd10.prod.outlook.com (2603:10b6:a03:11e::32)
 by BYAPR10MB2424.namprd10.prod.outlook.com (2603:10b6:a02:b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 3 Jun
 2021 18:45:40 +0000
Received: from BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0]) by BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::b09d:e36a:4258:d3d0%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 18:45:40 +0000
Subject: Re: vhost: multiple worker support
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210525180600.6349-1-michael.christie@oracle.com>
 <YLirZVVeL95jm2/O@stefanha-x1.localdomain>
From: Mike Christie <michael.christie@oracle.com>
Message-ID: <abf48ec0-7058-5bda-5a85-3e2f1514928e@oracle.com>
Date: Thu, 3 Jun 2021 13:45:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLirZVVeL95jm2/O@stefanha-x1.localdomain>
Content-Language: en-US
X-Originating-IP: [73.88.28.6]
X-ClientProxiedBy: DM6PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:5:100::38) To BYAPR10MB3573.namprd10.prod.outlook.com
 (2603:10b6:a03:11e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [20.15.0.204] (73.88.28.6) by
 DM6PR03CA0061.namprd03.prod.outlook.com (2603:10b6:5:100::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Thu, 3 Jun 2021 18:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b407250-9157-431e-ac57-08d926bfc8c1
X-MS-TrafficTypeDiagnostic: BYAPR10MB2424:
X-Microsoft-Antispam-PRVS: <BYAPR10MB24242EA85E76FF846DD0A2C6F13C9@BYAPR10MB2424.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JSCtyszMLurMAL3gTACA7mDohdRDB+z0YeL+QK+D1IyCkMFzTDCFJsmNac4jnZfsILgLpC0894KOGE39lZp0qUGMqleN4OC9/JjkJmH3xtshpu3FJvV36QK4l23EBie0B5VIXZSnZpu5erKVr+f3gsXr3fzCalkmUwYgEyEVEUSZKXWsWlW/vJOquiGemLeqZHHD0LvPpFkDaF+PfgIcsU9XYL+EdRzQAYplH07yBvVkU+lRjPJrr5J9nj7T//BneJQDi3IC83ccp/AbEiYkTcO+ztklASaYmbeS8dWS7fpjUpARSdQuvOMk1xKJKJA8Qb7DsSx+6uCQVxwNSaaqHLGaseWv+gB8ixMyn2VwM3Q7bnIWqhN4NdUk4l/6XHPgzXNcxp9ujyL369kemSr40jrU/MDoT2CfqUyEiFxqxuvU+jq5Z9VF92tlTX0bB0SoEJD+BOTovea+zJxe3BWyTirsFTrBvpdBLYLKOdPvwZyaHK6hF+cxQpZGpxmrrMMf8RGuBX4a6HBqJE9PB0lfZcDn2nAXWPiNHl+fiz31inZ3XpnAnj5SJ4gEjqb6A5m/qNQRX9JMi9bJ3iRsE75psU86iDqI6lRPQToaLwdYOPT9knaj+XmBh2h9KAQoPKdfBGBEo6V/lztNnxt6wFqsW1e13w2N65pTjkCwiqYojC+OWZlryf1OE6XkLadxldY3hUqYfBg06rrbGh9ivNWX6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3573.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(136003)(39860400002)(31686004)(956004)(2616005)(6706004)(31696002)(86362001)(316002)(16576012)(38100700002)(83380400001)(36756003)(8936002)(478600001)(2906002)(16526019)(186003)(26005)(6486002)(8676002)(53546011)(4326008)(5660300002)(6916009)(66946007)(66556008)(66476007)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?qERAdT/tvKYbyMsotBru0+6W7KCd2RfUYDz9+AqHrifDAMjWyDxfpGkY?=
 =?Windows-1252?Q?S6AreTP3Y9bd0RFrRtxZ+uQ07qxBlKG2/oghlJC3+6acIl4ZvCg4yOGj?=
 =?Windows-1252?Q?rGR+CcYZNBE8Q9HqDrp1Y0guyXxk/DLjw0CRbYnzu+VrK9nrz1C3txlt?=
 =?Windows-1252?Q?m3fVjuAjlJiQKhZOgWIF9msXO4r7EDy/hMEhN9SSvyNMs7Ogv0U4DwAl?=
 =?Windows-1252?Q?kDWBUbt8YajlowqOapKsiNlNb+zraB+7qPwXU7w2KsCGaBqXOfKenf69?=
 =?Windows-1252?Q?W3i2Oti9lfHi98tpldCK2Y1H1ywDYLyT+mUHbXq1HqaYwkbIepMU88Cx?=
 =?Windows-1252?Q?WU1XnxWEppG4RZ62zDCW0LcmC6npjTrpXXwred9Fo6bBPdbPFHyLzNhr?=
 =?Windows-1252?Q?bwrDtLB3lnM84CD+Vk8LlTLJDvSIg3FxPpjPJsQcn+ikiHnA1+CL97bd?=
 =?Windows-1252?Q?ofmYUyEZhYh7AC1ie7v+LqQaZtLwpO9y877CL/bt3mN16cw/EARwua6R?=
 =?Windows-1252?Q?q1b4QUQPeEe1gXaiLXIUfZhuPthiteEDgCLCcbL5cVAWHHU+DntuQsAJ?=
 =?Windows-1252?Q?IMc18KU6fONSZNCbtpOYzUxe0F4rphxBfcvn7OcNn7HaB85w6F/lSgG3?=
 =?Windows-1252?Q?Oz94yfIKSjOXDNjYjC3cPCAlYC70GXSyj6q4Duz+/AIgICLwB0yNyFxc?=
 =?Windows-1252?Q?XbDKLUM1PRqGe0E3z8z28/5+NwlUeq+TpTdw2erJS+onmDHdLX6i4wYK?=
 =?Windows-1252?Q?Z2XEoMG7t0yAgZG8pKaPhHjzx+PjvfD/k8Coe6Pun7RysVF7122SfmH2?=
 =?Windows-1252?Q?5HnPw6Sg92wnsOX56WQqcMWkvpUGvw0q8P3WJqX7UhjUvjuHstnxf9A7?=
 =?Windows-1252?Q?u1daShkC8sXHgxTl1/rpzvtNvH3ro+WojQrdNXAvcmxx8oJNL7Mo0HGa?=
 =?Windows-1252?Q?s/bh31xEQ9GN+kfn7eFY2/hlYxq/7u98Jr2UpBjwBQ/1lT+KW+GL7QBN?=
 =?Windows-1252?Q?iJ1jcY38nSM5e7as3UkWHW5IUyLH00X/I4Ylm1fUS1knuYioghTbXNAC?=
 =?Windows-1252?Q?2K6tPoMGL7+lMhgPKBtNQGePpL+3X9d08S1MvEcAs+Te4tDRXlpNZExX?=
 =?Windows-1252?Q?fAu/CsBYVb+A0mRRtqC7C76IAS71DLAlPWgQzo7vHo6R7o/eEzi5X/wp?=
 =?Windows-1252?Q?C2s0yDmLZrZY9NiOuK5v5rQzkIK53WG5Vl7Cbus0n6Z18pFuOxcDn3UC?=
 =?Windows-1252?Q?FOK3fZZDShvrLhRwdR5/lz7KAKi8u5v9qcipe6a4IEz3mA5sHOBOYxGA?=
 =?Windows-1252?Q?0J0WGbtdeRm0odELvTLTgSiHyew0X+Q+5+gQOa09StuVzfT+lg5Clrzd?=
 =?Windows-1252?Q?LU7yap4F4HI+4H2BP6gyf2uvk3ToUVt34GTyQ641oeziGvSV0ecXT/gg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b407250-9157-431e-ac57-08d926bfc8c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3573.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 18:45:40.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqC1XVvEW/auZZn/oEAv84saJq3Yhav7VGIJasDQK1swjK3IicC7spWo7n1Fc5pMpcCWljgEvpukHqxR9IY1mjDK+GLDzsGT05iVfouKv0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2424
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10004
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030126
X-Proofpoint-GUID: hjntO2iN6Us4oBgnPkr561G4OXkCOG3P
X-Proofpoint-ORIG-GUID: hjntO2iN6Us4oBgnPkr561G4OXkCOG3P
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10004
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106030126
Cc: linux-scsi@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
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

On 6/3/21 5:13 AM, Stefan Hajnoczi wrote:
> On Tue, May 25, 2021 at 01:05:51PM -0500, Mike Christie wrote:
>> Results:
>> --------
>> When running with the null_blk driver and vhost-scsi I can get 1.2
>> million IOPs by just running a simple
>>
>> fio --filename=/dev/sda --direct=1 --rw=randrw --bs=4k --ioengine=libaio
>> --iodepth=128  --numjobs=8 --time_based --group_reporting --name=iops
>> --runtime=60 --eta-newline=1
>>
>> The VM has 8 vCPUs and sda has 8 virtqueues and we can do a total of
>> 1024 cmds per devices. To get 1.2 million IOPs I did have to tune and
>> ran the virsh emulatorpin command so the vhost threads were running
>> on different CPUs than the VM. If the vhost threads share CPUs then I
>> get around 800K.
>>
>> For a more real device that are also CPU hogs like iscsi, I can still
>> get 1 million IOPs using 1 dm-multipath device over 8 iscsi paths
>> (natively it gets 1.1 million IOPs).
> 
> There is no comparison against a baseline, but I guess it would be the
> same 8 vCPU guest with single queue vhost-scsi?
> 

For the iscsi device the max IOPs for the single thread case was around
380K IOPs.

Here are the results with null_blk as the backend device with a 16
vCPU guest to give you a better picture.

fio
numjobs 1        2        4        8        12       16
--------------------------------------------------------

Current upstream (single thread per vhost-scsi device).
After 8 jobs there was no perf diff.
********************************************************
VQs
1       130k     338k     390k     404k     -        -
2       146k     440k     448k     478k     -        -
4       146k     456k     448k     482k     -        -
8       154k     464k     500k     490k     -        -
12      160k     454k     486k     490k     -        -
16      162k     460k     484k     486k     -        -

thread per VQ:
After 16 jobs there was no perf diff even if I increased
the number of guest vCPUs.
*********************************************************
1	same as above
2       166k     320k     542k     664k     558k     658k
4       156k     310k     660k     986k     860k     890k
8       156k     328k     652k     988k     972k     1074k
12      162k     336k     660k     1172k    1190k    1324
16      162k     332k     664k     1398k    850k     1426k

Note:
- For numjobs > 8, I lowered iodepth so we had a total of 1024
cmds over all jobs.
- virtqueue_size/cmd_per_lun=1024 was used for all tests.
- If I modify vhost-scsi so vhost_scsi_handle_vq queues the
response immediately so we never enter the LIO/block/scsi layers
then I can get around 1.6-1.8M IOPs as the max.
- There are some device wide locks in the LIO main IO path that
we are hitting in these results. We are working on removing them.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
