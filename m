Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4AA1F94AF
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 12:37:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFAB5878EA;
	Mon, 15 Jun 2020 10:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iQqoCwT6UL8; Mon, 15 Jun 2020 10:37:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79CEA87D45;
	Mon, 15 Jun 2020 10:37:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53EA9C016E;
	Mon, 15 Jun 2020 10:37:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EFBEC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 10:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 64A5587160
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 10:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nsgV9s406IG
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 10:37:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9DCDF869D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 10:37:34 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F9WB8k191943; Mon, 15 Jun 2020 06:37:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31mua61uwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:37:33 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FAIrP7011677;
 Mon, 15 Jun 2020 06:37:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31mua61uvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:37:32 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FATw2G015404;
 Mon, 15 Jun 2020 10:37:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 31mpe83chp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 10:37:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05FAaAMr64684452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 10:36:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 990E711C05B;
 Mon, 15 Jun 2020 10:37:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A22611C05C;
 Mon, 15 Jun 2020 10:37:27 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.56.158])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 10:37:27 +0000 (GMT)
Date: Mon, 15 Jun 2020 12:37:25 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
Message-ID: <20200615123725.13f6a8de.pasic@linux.ibm.com>
In-Reply-To: <a02b9f94-eb48-4ae2-0ade-a4ce26b61ad8@redhat.com>
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
 <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
 <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
 <6356ba7f-afab-75e1-05ff-4a22b88c610e@linux.ibm.com>
 <a02b9f94-eb48-4ae2-0ade-a4ce26b61ad8@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_17:2020-06-12,
 2020-06-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150075
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, mst@redhat.com, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, kvm@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCAxNSBKdW4gMjAyMCAxMTowMTo1NSArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gPiBodW0sIGluIGJldHdlZW4gSSBmb3VuZCBhbm90aGVyIHdh
eSB3aGljaCBzZWVtcyB0byBtZSBtdWNoIGJldHRlcjoKPiA+Cj4gPiBXZSBhbHJlYWR5IGhhdmUg
dGhlIGZvcmNlX2RtYV91bmVuY3J5cHRlZCgpIGZ1bmN0aW9uIGF2YWlsYWJsZSB3aGljaCAKPiA+
IEFGQUlVIGlzIHdoYXQgd2Ugd2FudCBmb3IgZW5jcnlwdGVkIG1lbW9yeSBwcm90ZWN0aW9uIGFu
ZCBpcyBhbHJlYWR5IAo+ID4gdXNlZCBieSBwb3dlciBhbmQgeDg2IFNFVi9TTUUgaW4gYSB3YXkg
dGhhdCBzZWVtcyBBRkFJVSBjb21wYXRpYmxlIAo+ID4gd2l0aCBvdXIgcHJvYmxlbS4KPiA+Cj4g
PiBFdmVuIERNQSBhbmQgSU9NTVUgYXJlIGRpZmZlcmVudCB0aGluZ3MsIEkgdGhpbmsgdGhleSBz
aG91bGQgYmUgdXNlZCAKPiA+IHRvZ2V0aGVyIGluIG91ciBjYXNlLgo+ID4KPiA+IFdoYXQgZG8g
eW91IHRoaW5rPwo+ID4KPiA+IFRoZSBwYXRjaCB3b3VsZCB0aGVuIGJlIHNvbWV0aGluZyBsaWtl
Ogo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYyBiL2RyaXZlcnMv
dmlydGlvL3ZpcnRpby5jCj4gPiBpbmRleCBhOTc3ZTMyYTg4ZjIuLjUzNDc2ZDViYmUzNSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpby5jCj4gPiArKysgYi9kcml2ZXJzL3Zp
cnRpby92aXJ0aW8uYwo+ID4gQEAgLTQsNiArNCw3IEBACj4gPiDCoCNpbmNsdWRlIDxsaW51eC92
aXJ0aW9fY29uZmlnLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+IMKgI2lu
Y2x1ZGUgPGxpbnV4L2lkci5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9kbWEtZGlyZWN0Lmg+Cj4g
PiDCoCNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19pZHMuaD4KPiA+Cj4gPiDCoC8qIFVuaXF1
ZSBudW1iZXJpbmcgZm9yIHZpcnRpbyBkZXZpY2VzLiAqLwo+ID4gQEAgLTE3OSw2ICsxODAsMTAg
QEAgaW50IHZpcnRpb19maW5hbGl6ZV9mZWF0dXJlcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAKPiA+
ICpkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJ
UlRJT19GX1ZFUlNJT05fMSkpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4gPgo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoZm9yY2VfZG1hX3VuZW5jcnlwdGVkKCZk
ZXYtPmRldikgJiYKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAhdmlydGlvX2hhc19mZWF0dXJl
KGRldiwgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0pKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FSU87Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoCB2aXJ0aW9fYWRk
X3N0YXR1cyhkZXYsIFZJUlRJT19DT05GSUdfU19GRUFUVVJFU19PSyk7Cj4gPiDCoMKgwqDCoMKg
wqDCoCBzdGF0dXMgPSBkZXYtPmNvbmZpZy0+Z2V0X3N0YXR1cyhkZXYpOwo+ID4gwqDCoMKgwqDC
oMKgwqAgaWYgKCEoc3RhdHVzICYgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKSkgeyAgCj4g
Cj4gCj4gSSB0aGluayB0aGlzIGNhbiB3b3JrIGJ1dCBuZWVkIHRvIGxpc3RlbiBmcm9tIE1pY2hh
ZWwKCkkgZG9uJ3QgdGhpbmsgQ2hyaXN0b3BoIEhlbGx3aWcgd2lsbCBsaWtlIGZvcmNlX2RtYV91
bmVuY3J5cHRlZCgpCmluIHZpcnRpbyBjb2RlOgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC8y
LzIwLzYzMAoKUmVnYXJkcywKSGFsaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
