Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E17B008E
	for <lists.virtualization@lfdr.de>; Wed, 27 Sep 2023 11:36:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DDF540359;
	Wed, 27 Sep 2023 09:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DDF540359
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqzFObf3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A8mIhIgKbyr; Wed, 27 Sep 2023 09:36:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E3077400D8;
	Wed, 27 Sep 2023 09:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3077400D8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44712C0DD3;
	Wed, 27 Sep 2023 09:36:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 828F4C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 09:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2B882AC6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 09:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D2B882AC6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=kqzFObf3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2WQOnI5Jc0Y
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 09:36:48 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26C8082A7F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 09:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C8082A7F
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38R9Fk2R025606; Wed, 27 Sep 2023 09:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=IkLbV0Pz2XDtSKSWv403UvnCHBWnP/TinHDuZPlM1nc=;
 b=kqzFObf3PYvd7EbZ68J+hL53rN1X/G05fSlJA6u/oMAXPlGJ2N2VNpvx7SZe3DJ293V7
 Q6Vh3LAHYheGe/DCuEHUjK0Xa2XDLbl7dzL4tyswEyPkOQcVOnvvdZ8Q2pVkuSuHy0xB
 e14X6J28dDyRvNpt3qzES4v3O+oCWx6e3NFl1WTJ/tkDUCTmki5AzccRtC5jPw+mwLd0
 /Wz5t+Yg7ZG6TAn8aQ9c00EVp54fNZ1U1G96c0kKS+rV3gqJnTGcgZNFre7czILDw38U
 DinznDrqHOGUMXoEZ9edZfpR3sRkA8DeDbY/NADoNpyockwAvv5SR9c6FOIfYnyQxJzb Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tch9f10d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 09:36:21 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38R9UDak010309;
 Wed, 27 Sep 2023 09:36:20 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tch9f10ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 09:36:20 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38R81446008167; Wed, 27 Sep 2023 09:36:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3taaqyjnk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 09:36:18 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38R9aF4842271434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Sep 2023 09:36:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B3EB2004E;
 Wed, 27 Sep 2023 09:36:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74D5720040;
 Wed, 27 Sep 2023 09:36:14 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.79.41])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
 Wed, 27 Sep 2023 09:36:14 +0000 (GMT)
Date: Wed, 27 Sep 2023 11:36:12 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] crypto: virtio-crypto: call finalize with bh disabled
Message-ID: <20230927113612.3c46c20c.pasic@linux.ibm.com>
In-Reply-To: <20230926130521-mutt-send-email-mst@kernel.org>
References: <1914739e2de14ed396e5674aa2d4766c@huawei.com>
 <20230926184158.4ca2c0c3.pasic@linux.ibm.com>
 <20230926130521-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2akQb3dZW89laYdAKzdNwTw2BmGVBdBJ
X-Proofpoint-ORIG-GUID: 62mVAe7pSjKh81-Kj_g5UDMo7ZlKhuL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_04,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 mlxlogscore=410 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270078
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pizhenwei@bytedance.com" <pizhenwei@bytedance.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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

On Tue, 26 Sep 2023 13:13:51 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > On the other hand virtio_airq_handler() calls vring_interrupt() with
> > interrupts enabled. (While vring_interrupt() is called in a (read)
> > critical section in virtio_airq_handler() we use read_lock() and
> > not read_lock_irqsave() to grab the lock. Whether that is correct in
> > it self (i.e. disregarding the crypto problem) or not I'm not sure right
> > now. Will think some more about it tomorrow.) If the way to go forward
> > is disabling interrupts in virtio-ccw before vring_interrupt() is
> > called, I would be glad to spin a patch for that.
> > 
> > Copying Conny, as she may have an opinion on this (if I'm not wrong she
> > authored that code).
> > 
> > Regards,
> > Halil  
> 
> On a related note, config change callback is also handled incorrectly
> in this driver, it takes a mutex from interrupt context.

Thanks Michael! I intend to give Connie a little more time to chime in.
Assumed no controversies emerge I intend  to cook up two patches for
the two issues later during the day.

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
