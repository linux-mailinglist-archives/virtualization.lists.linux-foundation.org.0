Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DDC1F9598
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 13:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE0F786EF9;
	Mon, 15 Jun 2020 11:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nljMVdYr5ja; Mon, 15 Jun 2020 11:51:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2282986EAC;
	Mon, 15 Jun 2020 11:51:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1298C016E;
	Mon, 15 Jun 2020 11:51:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 201EDC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 19BB488A38
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSnbAq2jseXS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:51:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 69E84888B0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 11:51:04 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FA2gg4102076; Mon, 15 Jun 2020 07:51:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31p5erdtkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 07:51:03 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FA3w3T107339;
 Mon, 15 Jun 2020 07:51:02 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31p5erdtjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 07:51:02 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FBjY22032443;
 Mon, 15 Jun 2020 11:51:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 31mpe7ufaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:51:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FBovbF56033282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 11:50:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8141AAE05A;
 Mon, 15 Jun 2020 11:50:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07EE8AE045;
 Mon, 15 Jun 2020 11:50:57 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.1.141])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 11:50:56 +0000 (GMT)
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
To: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
 <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
 <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
 <6356ba7f-afab-75e1-05ff-4a22b88c610e@linux.ibm.com>
 <a02b9f94-eb48-4ae2-0ade-a4ce26b61ad8@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <52cde80c-f33a-dbb7-d0b0-2733b3eb85c3@linux.ibm.com>
Date: Mon, 15 Jun 2020 13:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a02b9f94-eb48-4ae2-0ade-a4ce26b61ad8@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150082
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

CgpPbiAyMDIwLTA2LTE1IDA1OjAxLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvNi8x
MiDkuIvljYg3OjM4LCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjAtMDYtMTIg
MTE6MjEsIFBpZXJyZSBNb3JlbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMjAyMC0wNi0xMSAwNTox
MCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pgo+Pj4+IE9uIDIwMjAvNi8xMCDkuIvljYg5OjExLCBQ
aWVycmUgTW9yZWwgd3JvdGU6Cj4+Pj4+IFByb3RlY3RlZCBWaXJ0dWFsaXNhdGlvbiBwcm90ZWN0
cyB0aGUgbWVtb3J5IG9mIHRoZSBndWVzdCBhbmQKPj4+Pj4gZG8gbm90IGFsbG93IGEgdGhlIGhv
c3QgdG8gYWNjZXNzIGFsbCBvZiBpdHMgbWVtb3J5Lgo+Pj4+Pgo+Pj4+PiBMZXQncyByZWZ1c2Ug
YSBWSVJUSU8gZGV2aWNlIHdoaWNoIGRvZXMgbm90IHVzZSBJT01NVQo+Pj4+PiBwcm90ZWN0ZWQg
YWNjZXNzLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUgTW9yZWwgPHBtb3JlbEBs
aW51eC5pYm0uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqAgZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0
aW9fY2N3LmMgfCA1ICsrKysrCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Nj
dy5jIAo+Pj4+PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+Pj4+IGluZGV4
IDU3MzA1NzJiNTJjZC4uMDZmZmJjOTY1ODdhIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL3Mz
OTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+Pj4+PiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3Zp
cnRpb19jY3cuYwo+Pj4+PiBAQCAtOTg2LDYgKzk4NiwxMSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9f
Y2N3X3NldF9zdGF0dXMoc3RydWN0IAo+Pj4+PiB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1OCBzdGF0
dXMpCj4+Pj4+IMKgwqDCoMKgwqAgaWYgKCFjY3cpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47Cj4+Pj4+ICvCoMKgwqAgLyogUHJvdGVjdGVkIFZpcnR1YWxpc2F0aW9uIGd1ZXN0IG5l
ZWRzIElPTU1VICovCj4+Pj4+ICvCoMKgwqAgaWYgKGlzX3Byb3RfdmlydF9ndWVzdCgpICYmCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCAhX192aXJ0aW9fdGVzdF9iaXQodmRldiwgVklSVElPX0ZfSU9N
TVVfUExBVEZPUk0pKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgJj0gflZJ
UlRJT19DT05GSUdfU19GRUFUVVJFU19PSzsKPj4+Pj4gKwo+Pj4+PiDCoMKgwqDCoMKgIC8qIFdy
aXRlIHRoZSBzdGF0dXMgdG8gdGhlIGhvc3QuICovCj4+Pj4+IMKgwqDCoMKgwqAgdmNkZXYtPmRt
YV9hcmVhLT5zdGF0dXMgPSBzdGF0dXM7Cj4+Pj4+IMKgwqDCoMKgwqAgY2N3LT5jbWRfY29kZSA9
IENDV19DTURfV1JJVEVfU1RBVFVTOwo+Pj4+Cj4+Pj4KPj4+PiBJIHdvbmRlciB3aGV0aGVyIHdl
IG5lZWQgbW92ZSBpdCB0byB2aXJ0aW8gY29yZSBpbnN0ZWFkIG9mIGNjdy4KPj4+Pgo+Pj4+IEkg
dGhpbmsgdGhlIG90aGVyIG1lbW9yeSBwcm90ZWN0aW9uIHRlY2hub2xvZ2llcyBtYXkgc3VmZmVy
IGZyb20gCj4+Pj4gdGhpcyBhcyB3ZWxsLgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+Cj4+Pgo+
Pj4gV2hhdCB3b3VsZCB5b3UgdGhpbmsgb2YgdGhlIGZvbGxvd2luZywgYWxzbyB0YWtpbmcgaW50
byBhY2NvdW50IAo+Pj4gQ29ubmllJ3MgY29tbWVudCBvbiB3aGVyZSB0aGUgdGVzdCBzaG91bGQg
YmUgZG9uZToKPj4+Cj4+PiAtIGRlY2xhcmUgYSB3ZWFrIGZ1bmN0aW9uIGluIHZpcnRpby5jIGNv
ZGUsIHJldHVybmluZyB0aGF0IG1lbW9yeSAKPj4+IHByb3RlY3Rpb24gaXMgbm90IGluIHVzZS4K
Pj4+Cj4+PiAtIG92ZXJ3cml0ZSB0aGUgZnVuY3Rpb24gaW4gdGhlIGFyY2ggY29kZQo+Pj4KPj4+
IC0gY2FsbCB0aGlzIGZ1bmN0aW9uIGluc2lkZSBjb3JlIHZpcnRpb19maW5hbGl6ZV9mZWF0dXJl
cygpIGFuZCBpZiAKPj4+IHJlcXVpcmVkIGZhaWwgaWYgdGhlIGRldmljZSBkb24ndCBoYXZlIFZJ
UlRJT19GX0lPTU1VX1BMQVRGT1JNLgo+IAo+IAo+IEkgdGhpbmsgdGhpcyBpcyBmaW5lLgo+IAoK
VGhhbmtzLApJIHRyeSB0aGlzLgoKUmVnYXJkcywKUGllcnJlCgoKCgotLSAKUGllcnJlIE1vcmVs
CklCTSBMYWIgQm9lYmxpbmdlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
