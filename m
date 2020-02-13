Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D0915BBB6
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 10:30:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC48D85F92;
	Thu, 13 Feb 2020 09:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZTOXwkmR3_5; Thu, 13 Feb 2020 09:30:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4181C85FA3;
	Thu, 13 Feb 2020 09:30:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F87FC0177;
	Thu, 13 Feb 2020 09:30:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7332C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 09:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D452E20424
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 09:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ybblpi4Hhq1Q
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 09:30:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id ED4B7203D3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 09:30:21 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D9UJWB081492 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 04:30:21 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4j875px4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 04:30:20 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Thu, 13 Feb 2020 09:30:08 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Feb 2020 09:30:04 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01D9T9lq50266442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Feb 2020 09:29:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A3AA4054;
 Thu, 13 Feb 2020 09:30:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CE46A4062;
 Thu, 13 Feb 2020 09:30:03 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.71])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Feb 2020 09:30:03 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com>
 <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
 <4c3f70b7-723a-8b0f-ac49-babef1bcc180@de.ibm.com>
 <50a79c3491ac483583c97df2fac29e2c3248fdea.camel@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Thu, 13 Feb 2020 10:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <50a79c3491ac483583c97df2fac29e2c3248fdea.camel@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20021309-0008-0000-0000-000003527267
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021309-0009-0000-0000-00004A731ADA
Message-Id: <8fbbfb49-99d1-7fee-e713-d6d5790fe866@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=2 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130074
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
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

CgpPbiAxMi4wMi4yMCAxNzozNCwgRXVnZW5pbyBQw6lyZXogd3JvdGU6Cj4gT24gVHVlLCAyMDIw
LTAyLTExIGF0IDE0OjEzICswMTAwLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4+Cj4+
IE9uIDExLjAyLjIwIDE0OjA0LCBFdWdlbmlvIFDDqXJleiB3cm90ZToKPj4+IE9uIE1vbiwgMjAy
MC0wMi0xMCBhdCAxMjowMSArMDEwMCwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+Pj4+
IE9uIDEwLjAyLjIwIDEwOjQ3LCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPj4+Pj4gSGkg
Q2hyaXN0aWFuLgo+Pj4+Pgo+Pj4+PiBJJ20gbm90IGFibGUgdG8gcmVwcm9kdWNlIHRoZSBmYWls
dXJlIHdpdGggZWNjYjg1MmYxZmU2YmVkZTYzMGUyZTRmMWExMjFhODFlMzQzNTRhYiBjb21taXQu
IENvdWxkIHlvdSBhZGQgbW9yZQo+Pj4+PiBkYXRhPwo+Pj4+PiBZb3VyIGNvbmZpZ3VyYXRpb24g
KGxpYnZpcnQgb3IgcWVtdSBsaW5lKSwgYW5kIGhvc3QncyBkbWVzZyBvdXRwdXQgaWYgYW55Pwo+
Pj4+Pgo+Pj4+PiBUaGFua3MhCj4+Pj4KPj4+PiBJZiBpdCB3YXMgbm90IG9idmlvdXMsIHRoaXMg
aXMgb24gczM5MHgsIGEgYmlnIGVuZGlhbiBzeXN0ZW0uCj4+Pj4KPj4+Cj4+PiBIaSBDaHJpc3Rp
YW4uIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZmFzdCByZXNwb25zZXMuCj4+Pgo+Pj4g
Q291bGQgeW91IHRyeSB0aGlzIHBhdGNoIG9uIHRvcCBvZiBlY2NiODUyZjFmZTZiZWRlNjMwZTJl
NGYxYTEyMWE4MWUzNDM1NGFiPwo+Pgo+PiBJIHN0aWxsIGdldCAKPj4gWyAgIDQzLjY2NTE0NV0g
R3Vlc3QgbW92ZWQgdXNlZCBpbmRleCBmcm9tIDAgdG8gMjg5Cj4+IGFmdGVyIHNvbWUgcmVib290
cy4KPj4KPj4KPj4+IFRoYW5rcyEKPj4+Cj4+PiBGcm9tIDcxZDBmOTEwOGExOGFhODk0Y2MwYzBj
MWM3ZWZiYWQzOWY0NjVhMjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+PiBGcm9tOiA9P1VU
Ri04P3E/RXVnZW5pbz0yMFA9QzM9QTlyZXo/PSA8Cj4+PiBlcGVyZXptYUByZWRoYXQuY29tPgo+
Pj4gRGF0ZTogVHVlLCAxMSBGZWIgMjAyMCAxMzoxOToxMCArMDEwMAo+Pj4gU3ViamVjdDogW1BB
VENIXSB2aG9zdDogZml4IHJldHVybiB2YWx1ZSBvZiB2aG9zdF9nZXRfdnFfZGVzYwo+Pj4KPj4+
IEJlZm9yZSBvZiB0aGUgYmF0Y2ggY2hhbmdlLCBpdCB3YXMgdGhlIGNoYWluJ3MgaGVhZC4gTmVl
ZCB0byBrZWVwIHRoYXQKPj4+IHdheSBvciB3ZSB3aWxsIG5vdCBiZSBhYmxlIHRvIGZyZWUgYSBj
aGFpbiBvZiBkZXNjcmlwdG9ycy4KPj4+Cj4+PiBGaXhlczogZWNjYjg1MmYxZmU2ICgidmhvc3Q6
IGJhdGNoaW5nIGZldGNoZXMiKQo+Pj4gLS0tCj4+PiAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwg
MyArLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuYwo+Pj4gaW5kZXggYjVhNTFiMWYyZTc5Li5mYzQyMmMzZTVjMDggMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhv
c3QuYwo+Pj4gQEAgLTI0MDksMTIgKzI0MDksMTEgQEAgaW50IHZob3N0X2dldF92cV9kZXNjKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLAo+Pj4gIAkJCSpvdXRfbnVtICs9IHJldDsKPj4+ICAJ
CX0KPj4+ICAKPj4+IC0JCXJldCA9IGRlc2MtPmlkOwo+Pj4gLQo+Pj4gIAkJaWYgKCEoZGVzYy0+
ZmxhZ3MgJiBWUklOR19ERVNDX0ZfTkVYVCkpCj4+PiAgCQkJYnJlYWs7Cj4+PiAgCX0KPj4+ICAK
Pj4+ICsJcmV0ID0gdnEtPmRlc2NzW3ZxLT5maXJzdF9kZXNjXS5pZDsKPj4+ICAJdnEtPmZpcnN0
X2Rlc2MgPSBpICsgMTsKPj4+ICAKPj4+ICAJcmV0dXJuIHJldDsKPj4+Cj4gCj4gU29ycnksIHN0
aWxsIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUuCj4gCj4gQ291bGQgd2UgdHJ5IHRv
IGRpc2FibGUgYWxsIHRoZSB2aG9zdCBmZWF0dXJlcz8KPiAKPiBUaGFua3MhCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+IGlu
ZGV4IDY2MTA4OGFlNmRjNy4uMDhmNmQyY2NiNjk3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuaAo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+IEBAIC0yNTAsMTEgKzI1
MCwxMSBAQCBpbnQgdmhvc3RfaW5pdF9kZXZpY2VfaW90bGIoc3RydWN0IHZob3N0X2RldiAqZCwg
Ym9vbCBlbmFibGVkKTsKPiAgICAgICAgIH0gd2hpbGUgKDApCj4gIAo+ICBlbnVtIHsKPiAtICAg
ICAgIFZIT1NUX0ZFQVRVUkVTID0gKDFVTEwgPDwgVklSVElPX0ZfTk9USUZZX09OX0VNUFRZKSB8
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICgxVUxMIDw8IFZJUlRJT19SSU5HX0ZfSU5ESVJF
Q1RfREVTQykgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAoMVVMTCA8PCBWSVJUSU9fUklO
R19GX0VWRU5UX0lEWCkgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAoMVVMTCA8PCBWSE9T
VF9GX0xPR19BTEwpIHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgKDFVTEwgPDwgVklSVElP
X0ZfQU5ZX0xBWU9VVCkgfAo+ICsgICAgICAgVkhPU1RfRkVBVFVSRVMgPSAvKiAoMVVMTCA8PCBW
SVJUSU9fRl9OT1RJRllfT05fRU1QVFkpIHwgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICAg
LyogKDFVTEwgPDwgVklSVElPX1JJTkdfRl9JTkRJUkVDVF9ERVNDKSB8ICovCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIC8qICgxVUxMIDw8IFZJUlRJT19SSU5HX0ZfRVZFTlRfSURYKSB8ICov
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIC8qICgxVUxMIDw8IFZIT1NUX0ZfTE9HX0FMTCkg
fCAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAvKiAoMVVMTCA8PCBWSVJUSU9fRl9BTllf
TEFZT1VUKSB8ICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgICgxVUxMIDw8IFZJUlRJT19G
X1ZFUlNJT05fMSkKPiAgfTsKPiAKCgpJIHN0aWxsIGdldCAgZ3Vlc3QgY3Jhc2hlcyB3aXRoIHRo
aXMgb24gdG9wIG9mIGVjY2I4NTJmMWZlNi4gKFRoZSBwYXRjaCBkaWQgbm90CmFwcGx5LCBJIGhh
ZCB0byBtYW51YWxseSBjb21tZW50IG91dCB0aGVzZSB0aGluZ3MpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
