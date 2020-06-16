Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6BD1FAA05
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 09:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35802893E5;
	Tue, 16 Jun 2020 07:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucFVL5031AC6; Tue, 16 Jun 2020 07:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 814E0893DC;
	Tue, 16 Jun 2020 07:35:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CA5EC016E;
	Tue, 16 Jun 2020 07:35:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9E5AC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 07:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B97E189540
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 07:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QReNrlcfi8do
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 07:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2041D8761C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 07:35:21 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7YTJM039093; Tue, 16 Jun 2020 03:35:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31mtxfmaet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 03:35:20 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05G7ZJS7042425;
 Tue, 16 Jun 2020 03:35:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31mtxfm9c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 03:35:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05G7Pklu008475;
 Tue, 16 Jun 2020 07:33:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 31mpe7vvn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 07:33:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05G7X5Wu42598406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 07:33:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 262064C044;
 Tue, 16 Jun 2020 07:33:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8FCF4C04A;
 Tue, 16 Jun 2020 07:33:04 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.26.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 07:33:04 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <b45e321a-5acb-9be2-4cd6-ae75d7f78f05@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <588f4b63-1e94-521a-b011-f1d8ced75173@linux.ibm.com>
Date: Tue, 16 Jun 2020 09:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b45e321a-5acb-9be2-4cd6-ae75d7f78f05@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 cotscore=-2147483648
 bulkscore=0 adultscore=0 mlxlogscore=740 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160053
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, cohuck@redhat.com, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CgpPbiAyMDIwLTA2LTE2IDA4OjIyLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvNi8x
NSDkuIvljYg4OjM5LCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4+IEFuIGFyY2hpdGVjdHVyZSBwcm90
ZWN0aW5nIHRoZSBndWVzdCBtZW1vcnkgYWdhaW5zdCB1bmF1dGhvcml6ZWQgaG9zdAo+PiBhY2Nl
c3MgbWF5IHdhbnQgdG8gZW5mb3JjZSBWSVJUSU8gSS9PIGRldmljZSBwcm90ZWN0aW9uIHRocm91
Z2ggdGhlCj4+IHVzZSBvZiBWSVJUSU9fRl9JT01NVV9QTEFURk9STS4KPj4KPj4gTGV0J3MgZ2l2
ZSBhIGNoYW5jZSB0byB0aGUgYXJjaGl0ZWN0dXJlIHRvIGFjY2VwdCBvciBub3QgZGV2aWNlcwo+
PiB3aXRob3V0IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
aWVycmUgTW9yZWwgPHBtb3JlbEBsaW51eC5pYm0uY29tPgo+IAo+IAo+IEFja2VkLWJ5OiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKVGhhbmtzLAoKUGllcnJlCgoKCi0tIApQaWVy
cmUgTW9yZWwKSUJNIExhYiBCb2VibGluZ2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
