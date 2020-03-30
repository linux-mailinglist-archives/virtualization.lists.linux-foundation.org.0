Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB0197542
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 09:14:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B542485623;
	Mon, 30 Mar 2020 07:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fX4xvxPZy6T1; Mon, 30 Mar 2020 07:14:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C8D9851A4;
	Mon, 30 Mar 2020 07:14:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32EE4C1D87;
	Mon, 30 Mar 2020 07:14:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25D72C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E5BC854E5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2cDC4SM7V3p
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:14:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5D253851A4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:14:06 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U74i8o138525 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 03:14:05 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3021vt9frk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 03:14:04 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Mon, 30 Mar 2020 08:13:51 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 08:13:47 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02U7Ct1t50856364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 07:12:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3DD84C044;
 Mon, 30 Mar 2020 07:13:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 778C44C040;
 Mon, 30 Mar 2020 07:13:57 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.3.56])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 07:13:57 +0000 (GMT)
Subject: Re: [PATCH 0/6] vhost: Reset batched descriptors on SET_VRING_BASE
 call
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200329113359.30960-1-eperezma@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Mon, 30 Mar 2020 09:13:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200329113359.30960-1-eperezma@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20033007-0016-0000-0000-000002FACC3C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033007-0017-0000-0000-0000335E8408
Message-Id: <bb95e827-f219-32fd-0046-41046eec058b@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300062
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

Ck9uIDI5LjAzLjIwIDEzOjMzLCBFdWdlbmlvIFDDqXJleiB3cm90ZToKPiBWaG9zdCBkaWQgbm90
IHJlc2V0IHByb3Blcmx5IHRoZSBiYXRjaGVkIGRlc2NyaXB0b3JzIG9uIFNFVF9WUklOR19CQVNF
IGV2ZW50LiBCZWNhdXNlIG9mIHRoYXQsIGlzIHBvc3NpYmxlIHRvIHJldHVybiBhbiBpbnZhbGlk
IGRlc2NyaXB0b3IgdG8gdGhlIGd1ZXN0LgoKSSBndWVzcyB0aGlzIGNvdWxkIGV4cGxhaW4gbXkg
cHJvYmxlbXMgdGhhdCBJIGhhdmUgc2VlbiBkdXJpbmcgcmVzZXQ/Cgo+IAo+IFRoaXMgc2VyaWVz
IGFtbWVuZCB0aGlzLCBhbmQgY3JlYXRlcyBhIHRlc3QgdG8gYXNzZXJ0IGNvcnJlY3QgYmVoYXZp
b3IuIFRvIGRvIHRoYXQsIHRoZXkgbmVlZCB0byBleHBvc2UgYSBuZXcgZnVuY3Rpb24gaW4gdmly
dGlvX3JpbmcsIHZpcnRxdWV1ZV9yZXNldF9mcmVlX2hlYWQuIE5vdCBzdXJlIGlmIHRoaXMgY2Fu
IGJlIGF2b2lkZWQuCj4gCj4gQWxzbywgY2hhbmdlIGZyb20gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMjAvMy8yNy8xMDggaXMgbm90IGluY2x1ZGVkLCB0aGF0IGF2b2lkcyB0byB1cGRhdGUgYSB2
YXJpYWJsZSBpbiBhIGxvb3Agd2hlcmUgaXQgY2FuIGJlIHVwZGF0ZWQgb25jZS4KPiAKPiBUaGlz
IGlzIG1lYW50IHRvIGJlIGFwcGxpZWQgb24gdG9wIG9mIGVjY2I4NTJmMWZlNmJlZGU2MzBlMmU0
ZjFhMTIxYTgxZTM0MzU0YWIgaW4gZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L21zdC92aG9zdC5naXQsIGFuZCBzb21lIGNvbW1pdHMgc2hvdWxkIGJlIHNxdWFzaGVkIHdp
dGggdGhhdCBzZXJpZXMuCj4gCj4gRXVnZW5pbyBQw6lyZXogKDYpOgo+ICAgdG9vbHMvdmlydGlv
OiBBZGQgLS1iYXRjaCBvcHRpb24KPiAgIHRvb2xzL3ZpcnRpbzogQWRkIC0tYmF0Y2g9cmFuZG9t
IG9wdGlvbgo+ICAgdG9vbHMvdmlydGlvOiBBZGQgLS1yZXNldD1yYW5kb20KPiAgIHRvb2xzL3Zp
cnRpbzogTWFrZSAtLXJlc2V0IHJlc2V0IHJpbmcgaWR4Cj4gICB2aG9zdDogRGVsZXRlIHZpcnRx
dWV1ZSBiYXRjaF9kZXNjcyBtZW1iZXIKPiAgIGZpeHVwISB2aG9zdDogYmF0Y2hpbmcgZmV0Y2hl
cwo+IAo+ICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAgICAgICAgIHwgIDU3ICsrKysrKysrKysrKysr
KysKPiAgZHJpdmVycy92aG9zdC90ZXN0LmggICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvdmhv
c3Qvdmhvc3QuYyAgICAgICAgfCAgMTIgKysrLQo+ICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggICAg
ICAgIHwgICAxIC0KPiAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyB8ICAxOCArKysrKwo+
ICBpbmNsdWRlL2xpbnV4L3ZpcnRpby5oICAgICAgIHwgICAyICsKPiAgdG9vbHMvdmlydGlvL2xp
bnV4L3ZpcnRpby5oICB8ICAgMiArCj4gIHRvb2xzL3ZpcnRpby92aXJ0aW9fdGVzdC5jICAgfCAx
MjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgOCBmaWxlcyBjaGFuZ2Vk
LCAyMDEgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
