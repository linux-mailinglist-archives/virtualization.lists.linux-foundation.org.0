Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F66044B3
	for <lists.virtualization@lfdr.de>; Wed, 19 Oct 2022 14:11:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C529083F6C;
	Wed, 19 Oct 2022 12:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C529083F6C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GV9U3uya
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgAc2JA5M6gW; Wed, 19 Oct 2022 12:11:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6E58683F8C;
	Wed, 19 Oct 2022 12:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E58683F8C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 923E0C007C;
	Wed, 19 Oct 2022 12:11:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8B70C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7131041BA3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7131041BA3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=GV9U3uya
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KFXV7Q6l6th
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:11:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FA041B7C
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35FA041B7C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Oct 2022 12:11:44 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JBg3G7021986;
 Wed, 19 Oct 2022 12:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZzuVcZgnnqodlKcxc5xgtSak43R7utH5BttgaO6CPU4=;
 b=GV9U3uyaFkZbsMrJDNxTnxVZTxXExDADNLimbNyL6ELe/Y7EqXf2wMU0/JMN3piLKykg
 kDz+Be179HOMWG746C0pSuWL633FO99I8tVaf82drsjH3sb74B3ySz68SADaUJdKwH5e
 QAvumlB5XiUrF/A7qmxpc2/YyC2wMi0E7yP79W88ytd/109xV/Dojcrb0b3x4dWi9hTO
 XUDf/n7onakOGYyENan3Geo5f6LyQY6gz5Szf/UEZEEpXgswB1BgqCC5sZAUu4ivqE1y
 7oUzTInuFY6Jr7AcFq9kPOhdr8DviCCv2c7LYOqmCjMWUwvH/yOcbWFDORwC9yWqbV/8 yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kagkd8uja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 12:11:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JC5oLi037169;
 Wed, 19 Oct 2022 12:11:42 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kagkd8ugq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 12:11:42 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JC7Ynt002540;
 Wed, 19 Oct 2022 12:11:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3k7mg95a5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 12:11:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29JCBc5d65274202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 12:11:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE76111C04C;
 Wed, 19 Oct 2022 12:11:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9549E11C050;
 Wed, 19 Oct 2022 12:11:37 +0000 (GMT)
Received: from [9.171.25.9] (unknown [9.171.25.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Oct 2022 12:11:37 +0000 (GMT)
Message-ID: <780306ca-4aba-3cf7-88ca-75e1903f76d0@linux.ibm.com>
Date: Wed, 19 Oct 2022 14:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: 6.1-rc1 regression: virtio-net cpumask and during reboot
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <ac72ff9d-4246-3631-6e31-8c3033a70bf0@linux.ibm.com>
 <20221019074308-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20221019074308-mutt-send-email-mst@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ooEFqfkMoxOHaQW64naUxwGRGpj3Tyx-
X-Proofpoint-GUID: LAZ69Oau8qFe_6EO9_QNzIaHYgKmaM9c
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190067
Cc: linux-s390 <linux-s390@vger.kernel.org>, kvm list <kvm@vger.kernel.org>,
 Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Am 19.10.22 um 13:50 schrieb Michael S. Tsirkin:
> On Wed, Oct 19, 2022 at 12:59:58PM +0200, Christian Borntraeger wrote:
>> Michael,
>>
>> as a heads-up.
>> I have not looked into any details yet but we do get the following during reboot of a system on s390.
>> It seems to be new with 6.1-rc1 (over 6.0)
>>
>>    [    8.532461] ------------[ cut here ]------------
>>    [    8.532497] WARNING: CPU: 8 PID: 377 at include/linux/cpumask.h:110 __netif_set_xps_queue+0x3d8/0xca8
>>    [    8.532507] Modules linked in: sha1_s390(+) sha_common virtio_net(+) net_failover failover pkey zcrypt rng_core autofs4
>>    [    8.532528] CPU: 8 PID: 377 Comm: systemd-udevd Not tainted 6.1.0-20221018.rc1.git15.0fd5f2557625.300.fc36.s390x+debug #1
>>    [    8.532533] Hardware name: IBM 8561 T01 701 (KVM/Linux)
>>    [    8.532537] Krnl PSW : 0704e00180000000 00000000b05ec33c (__netif_set_xps_queue+0x3dc/0xca8)
>>    [    8.532546]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3
>>    [    8.532552] Krnl GPRS: 00000000e7fb8b3f 0000000080000001 00000000b1870700 00000000b0ca1d3c
>>    [    8.532557]            0000000000000100 0000000000000300 000000008b362500 00000000b133ba48
>>    [    8.532561]            000000000000000c 0000038000000100 000000000000000c 0000000000000070
>>    [    8.532566]            0000000084cd3200 0000000000000000 00000000b05ec0c2 00000380010b77c8
>>    [    8.532575] Krnl Code: 00000000b05ec32e: c0e500187331      brasl   %r14,00000000b08fa990
>>                              00000000b05ec334: a7f4ff0c          brc     15,00000000b05ec14c
>>                             #00000000b05ec338: af000000          mc      0,0
>>                             >00000000b05ec33c: ec76fed8007c      cgij    %r7,0,6,00000000b05ec0ec
>>                              00000000b05ec342: e310f0b00004      lg      %r1,176(%r15)
>>                              00000000b05ec348: ec16ffac007c      cgij    %r1,0,6,00000000b05ec2a0
>>                              00000000b05ec34e: ec680388007c      cgij    %r6,0,8,00000000b05eca5e
>>                              00000000b05ec354: e310f0b80004      lg      %r1,184(%r15)
>>    [    8.532600] Call Trace:
>>    [    8.532604]  [<00000000b05ec33c>] __netif_set_xps_queue+0x3dc/0xca8
>>    [    8.532609] ([<00000000b05ec0c2>] __netif_set_xps_queue+0x162/0xca8)
>>    [    8.532614]  [<000003ff7fbb81ce>] virtnet_set_affinity+0x1de/0x2a0 [virtio_net]
>>    [    8.532622]  [<000003ff7fbbb674>] virtnet_probe+0x4d4/0xc08 [virtio_net]
>>    [    8.532630]  [<00000000b04ec4e8>] virtio_dev_probe+0x1e8/0x418
>>    [    8.532638]  [<00000000b05350ea>] really_probe+0xd2/0x480
>>    [    8.532644]  [<00000000b0535648>] driver_probe_device+0x40/0xf0
>>    [    8.532649]  [<00000000b0535fac>] __driver_attach+0x10c/0x208
>>    [    8.532655]  [<00000000b0532542>] bus_for_each_dev+0x82/0xb8
>>    [    8.532662]  [<00000000b053422e>] bus_add_driver+0x1d6/0x260
>>    [    8.532667]  [<00000000b0536a70>] driver_register+0xa8/0x170
>>    [    8.532672]  [<000003ff7fbc8088>] virtio_net_driver_init+0x88/0x1000 [virtio_net]
>>    [    8.532680]  [<00000000afb50ab0>] do_one_initcall+0x78/0x388
>>    [    8.532685]  [<00000000afc7b5b8>] do_init_module+0x60/0x248
>>    [    8.532692]  [<00000000afc7ce96>] __do_sys_init_module+0xbe/0xd8
>>    [    8.532698]  [<00000000b09123b2>] __do_syscall+0x1da/0x208
>>    [    8.532704]  [<00000000b0925b12>] system_call+0x82/0xb0
>>    [    8.532710] 3 locks held by systemd-udevd/377:
>>    [    8.532715]  #0: 0000000089af5188 (&dev->mutex){....}-{3:3}, at: __driver_attach+0xfe/0x208
>>    [    8.532728]  #1: 00000000b14668f0 (cpu_hotplug_lock){++++}-{0:0}, at: virtnet_probe+0x4ca/0xc08 [virtio_net]
>>    [    8.532744]  #2: 00000000b1509d40 (xps_map_mutex){+.+.}-{3:3}, at: __netif_set_xps_queue+0x88/0xca8
>>    [    8.532757] Last Breaking-Event-Address:
>>    [    8.532760]  [<00000000b05ec0e0>] __netif_set_xps_queue+0x180/0xca8
> 
> 
> Does this fix it for you?
> 
> https://lore.kernel.org/r/20221017030947.1295426-1-yury.norov%40gmail.com

Yes, it does. Thanks a lot.

Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
