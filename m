Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8B1F75D4
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 11:21:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BFD9886DB;
	Fri, 12 Jun 2020 09:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0TYxANQThAT; Fri, 12 Jun 2020 09:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8145A886E6;
	Fri, 12 Jun 2020 09:21:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FB9AC016F;
	Fri, 12 Jun 2020 09:21:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51D65C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3FCE487C94
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKxkN-oXvQCZ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:21:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9C04887C91
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:21:15 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C91aFS097027; Fri, 12 Jun 2020 05:21:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m2yfeqsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:21:14 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C9I5gE156020;
 Fri, 12 Jun 2020 05:21:14 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m2yfeqry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:21:13 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C9BkQQ006444;
 Fri, 12 Jun 2020 09:21:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 31g2s7vje0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 09:21:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05C9L9IH64815448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 09:21:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 605B042049;
 Fri, 12 Jun 2020 09:21:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E287242042;
 Fri, 12 Jun 2020 09:21:08 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.76.70])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 09:21:08 +0000 (GMT)
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
To: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
 <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
Date: Fri, 12 Jun 2020 11:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 cotscore=-2147483648 clxscore=1015 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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

CgpPbiAyMDIwLTA2LTExIDA1OjEwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvNi8x
MCDkuIvljYg5OjExLCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4+IFByb3RlY3RlZCBWaXJ0dWFsaXNh
dGlvbiBwcm90ZWN0cyB0aGUgbWVtb3J5IG9mIHRoZSBndWVzdCBhbmQKPj4gZG8gbm90IGFsbG93
IGEgdGhlIGhvc3QgdG8gYWNjZXNzIGFsbCBvZiBpdHMgbWVtb3J5Lgo+Pgo+PiBMZXQncyByZWZ1
c2UgYSBWSVJUSU8gZGV2aWNlIHdoaWNoIGRvZXMgbm90IHVzZSBJT01NVQo+PiBwcm90ZWN0ZWQg
YWNjZXNzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUgTW9yZWwgPHBtb3JlbEBsaW51eC5p
Ym0uY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMgfCA1
ICsrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jIAo+PiBiL2RyaXZlcnMvczM5
MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+IGluZGV4IDU3MzA1NzJiNTJjZC4uMDZmZmJjOTY1ODdh
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+PiArKysg
Yi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+PiBAQCAtOTg2LDYgKzk4NiwxMSBA
QCBzdGF0aWMgdm9pZCB2aXJ0aW9fY2N3X3NldF9zdGF0dXMoc3RydWN0IAo+PiB2aXJ0aW9fZGV2
aWNlICp2ZGV2LCB1OCBzdGF0dXMpCj4+IMKgwqDCoMKgwqAgaWYgKCFjY3cpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqAgLyogUHJvdGVjdGVkIFZpcnR1YWxpc2F0aW9u
IGd1ZXN0IG5lZWRzIElPTU1VICovCj4+ICvCoMKgwqAgaWYgKGlzX3Byb3RfdmlydF9ndWVzdCgp
ICYmCj4+ICvCoMKgwqDCoMKgwqDCoCAhX192aXJ0aW9fdGVzdF9iaXQodmRldiwgVklSVElPX0Zf
SU9NTVVfUExBVEZPUk0pKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgJj0gflZJ
UlRJT19DT05GSUdfU19GRUFUVVJFU19PSzsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIFdyaXRlIHRo
ZSBzdGF0dXMgdG8gdGhlIGhvc3QuICovCj4+IMKgwqDCoMKgwqAgdmNkZXYtPmRtYV9hcmVhLT5z
dGF0dXMgPSBzdGF0dXM7Cj4+IMKgwqDCoMKgwqAgY2N3LT5jbWRfY29kZSA9IENDV19DTURfV1JJ
VEVfU1RBVFVTOwo+IAo+IAo+IEkgd29uZGVyIHdoZXRoZXIgd2UgbmVlZCBtb3ZlIGl0IHRvIHZp
cnRpbyBjb3JlIGluc3RlYWQgb2YgY2N3Lgo+IAo+IEkgdGhpbmsgdGhlIG90aGVyIG1lbW9yeSBw
cm90ZWN0aW9uIHRlY2hub2xvZ2llcyBtYXkgc3VmZmVyIGZyb20gdGhpcyBhcyAKPiB3ZWxsLgo+
IAo+IFRoYW5rcwo+IAoKCldoYXQgd291bGQgeW91IHRoaW5rIG9mIHRoZSBmb2xsb3dpbmcsIGFs
c28gdGFraW5nIGludG8gYWNjb3VudCBDb25uaWUncyAKY29tbWVudCBvbiB3aGVyZSB0aGUgdGVz
dCBzaG91bGQgYmUgZG9uZToKCi0gZGVjbGFyZSBhIHdlYWsgZnVuY3Rpb24gaW4gdmlydGlvLmMg
Y29kZSwgcmV0dXJuaW5nIHRoYXQgbWVtb3J5IApwcm90ZWN0aW9uIGlzIG5vdCBpbiB1c2UuCgot
IG92ZXJ3cml0ZSB0aGUgZnVuY3Rpb24gaW4gdGhlIGFyY2ggY29kZQoKLSBjYWxsIHRoaXMgZnVu
Y3Rpb24gaW5zaWRlIGNvcmUgdmlydGlvX2ZpbmFsaXplX2ZlYXR1cmVzKCkgYW5kIGlmIApyZXF1
aXJlZCBmYWlsIGlmIHRoZSBkZXZpY2UgZG9uJ3QgaGF2ZSBWSVJUSU9fRl9JT01NVV9QTEFURk9S
TS4KCkFsdGVybmF0aXZlIGNvdWxkIGJlIHRvIHRlc3QgYSBnbG9iYWwgdmFyaWFibGUgdGhhdCB0
aGUgYXJjaGl0ZWN0dXJlIAp3b3VsZCBvdmVyd3JpdGUgaWYgbmVlZGVkIGJ1dCBJIGZpbmQgdGhl
IHdlYWsgZnVuY3Rpb24gc29sdXRpb24gbW9yZSAKZmxleGlibGUuCgpXaXRoIGEgZnVuY3Rpb24s
IHdlIGFsc28gaGF2ZSB0aGUgcG9zc2liaWxpdHkgdG8gcHJvdmlkZSB0aGUgZGV2aWNlIGFzIAph
cmd1bWVudCBhbmQgdGFrZSBhY3Rpb25zIGRlcGVuZGluZyBpdCwgdGhpcyBtYXkgYW5zd2VyIEhh
bGlsJ3MgY29uY2Vybi4KClJlZ2FyZHMsClBpZXJyZQoKLS0gClBpZXJyZSBNb3JlbApJQk0gTGFi
IEJvZWJsaW5nZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
