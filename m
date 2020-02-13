Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC815C848
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 17:33:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A04C87F9C;
	Thu, 13 Feb 2020 16:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cT5aqPtbyXe; Thu, 13 Feb 2020 16:33:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54CF487F48;
	Thu, 13 Feb 2020 16:33:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4556FC1D8E;
	Thu, 13 Feb 2020 16:33:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D466EC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C28C2214D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcLYWBelA0F4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:33:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id E9EC620365
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:33:07 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DGQWn1061210 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 11:33:07 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y4qyb5vpe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 11:33:06 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Thu, 13 Feb 2020 16:33:04 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Feb 2020 16:33:00 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01DGWxIZ43778382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Feb 2020 16:33:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB36C11C058;
 Thu, 13 Feb 2020 16:32:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D8D411C050;
 Thu, 13 Feb 2020 16:32:59 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.71])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Feb 2020 16:32:59 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20200107042401-mutt-send-email-mst@kernel.org>
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
 <8fbbfb49-99d1-7fee-e713-d6d5790fe866@de.ibm.com>
 <2364d0728c3bb4bcc0c13b591f774109a9274a30.camel@redhat.com>
 <bb9fb726-306c-5330-05aa-a86bd1b18097@de.ibm.com>
 <468983fad50a5e74a739f71487f0ea11e8d4dfd1.camel@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Thu, 13 Feb 2020 17:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <468983fad50a5e74a739f71487f0ea11e8d4dfd1.camel@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20021316-0028-0000-0000-000003DA3DE9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021316-0029-0000-0000-0000249EB5B3
Message-Id: <2dc1df65-1431-3917-40e5-c2b12096e2a7@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_05:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130122
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

CgpPbiAxMy4wMi4yMCAxNzoyOSwgRXVnZW5pbyBQw6lyZXogd3JvdGU6Cj4gQ2FuIHdlIHRyeSB3
aXRoIHRoaXMgdHJhY2VzPwoKRG9lcyBub3QgYXBwbHkgb24gZWNjYjg1MmYxZmU2YmVkZTYzMGUy
ZTRmMWExMjFhODFlMzQzNTRhYiwgY2FuIHlvdSBkb3VibGUgY2hlY2s/Cgo+IAo+IEZyb20gYjc5
M2I0MTA2MDg1YWIxOTcwYmRlZGIzNDBlNDlmMzc4NDNlZDU4NSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKPiBGcm9tOiA9P1VURi04P3E/RXVnZW5pbz0yMFA9QzM9QTlyZXo/PSA8ZXBlcmV6bWFA
cmVkaGF0LmNvbT4KPiBEYXRlOiBUaHUsIDEzIEZlYiAyMDIwIDE3OjI3OjA1ICswMTAwCj4gU3Vi
amVjdDogW1BBVENIXSB2aG9zdDogQWRkIGRlYnVnIGluIGlvY3RsIGNhbGxzCj4gCj4gLS0tCj4g
IGRyaXZlcnMvdmhvc3QvbmV0LmMgICB8IDIwICsrKysrKysrKysrKysrKysrLS0tCj4gIGRyaXZl
cnMvdmhvc3Qvdmhvc3QuYyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3Zob3N0L25ldC5jIGIvZHJpdmVycy92aG9zdC9uZXQuYwo+IGluZGV4IGUxNTgxNTk2NzFm
YS4uZTRkNWY4NDNmOWMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvbmV0LmMKPiArKysg
Yi9kcml2ZXJzL3Zob3N0L25ldC5jCj4gQEAgLTE1MDUsMTAgKzE1MDUsMTMgQEAgc3RhdGljIGxv
bmcgdmhvc3RfbmV0X3NldF9iYWNrZW5kKHN0cnVjdCB2aG9zdF9uZXQgKm4sIHVuc2lnbmVkIGlu
ZGV4LCBpbnQgZmQpCj4gIAo+ICAJbXV0ZXhfbG9jaygmbi0+ZGV2Lm11dGV4KTsKPiAgCXIgPSB2
aG9zdF9kZXZfY2hlY2tfb3duZXIoJm4tPmRldik7Cj4gLQlpZiAocikKPiArCWlmIChyKSB7Cj4g
KwkJcHJfZGVidWcoInZob3N0X2Rldl9jaGVja19vd25lciBpbmRleD0ldSBmZD0lZCByYyByPSVk
IiwgaW5kZXgsIGZkLCByKTsKPiAgCQlnb3RvIGVycjsKPiArCX0KPiAgCj4gIAlpZiAoaW5kZXgg
Pj0gVkhPU1RfTkVUX1ZRX01BWCkgewo+ICsJCXByX2RlYnVnKCJ2aG9zdF9kZXZfY2hlY2tfb3du
ZXIgaW5kZXg9JXUgZmQ9JWQgTUFYPSVkIiwgaW5kZXgsIGZkLCBWSE9TVF9ORVRfVlFfTUFYKTsK
PiAgCQlyID0gLUVOT0JVRlM7Cj4gIAkJZ290byBlcnI7Cj4gIAl9Cj4gQEAgLTE1MTgsMjIgKzE1
MjEsMjYgQEAgc3RhdGljIGxvbmcgdmhvc3RfbmV0X3NldF9iYWNrZW5kKHN0cnVjdCB2aG9zdF9u
ZXQgKm4sIHVuc2lnbmVkIGluZGV4LCBpbnQgZmQpCj4gIAo+ICAJLyogVmVyaWZ5IHRoYXQgcmlu
ZyBoYXMgYmVlbiBzZXR1cCBjb3JyZWN0bHkuICovCj4gIAlpZiAoIXZob3N0X3ZxX2FjY2Vzc19v
ayh2cSkpIHsKPiArCQlwcl9kZWJ1Zygidmhvc3RfbmV0X3NldF9iYWNrZW5kIGluZGV4PSV1IGZk
PSVkICF2aG9zdF92cV9hY2Nlc3Nfb2siLCBpbmRleCwgZmQpOwo+ICAJCXIgPSAtRUZBVUxUOwo+
ICAJCWdvdG8gZXJyX3ZxOwo+ICAJfQo+ICAJc29jayA9IGdldF9zb2NrZXQoZmQpOwo+ICAJaWYg
KElTX0VSUihzb2NrKSkgewo+ICAJCXIgPSBQVFJfRVJSKHNvY2spOwo+ICsJCXByX2RlYnVnKCJ2
aG9zdF9uZXRfc2V0X2JhY2tlbmQgaW5kZXg9JXUgZmQ9JWQgZ2V0X3NvY2tldCBlcnIgcj0lZCIs
IGluZGV4LCBmZCwgcik7Cj4gIAkJZ290byBlcnJfdnE7Cj4gIAl9Cj4gIAo+ICAJLyogc3RhcnQg
cG9sbGluZyBuZXcgc29ja2V0ICovCj4gIAlvbGRzb2NrID0gdnEtPnByaXZhdGVfZGF0YTsKPiAg
CWlmIChzb2NrICE9IG9sZHNvY2spIHsKPiArCQlwcl9kZWJ1Zygic29jaz0lcCAhPSBvbGRzb2Nr
PSVwIGluZGV4PSV1IGZkPSVkIHZxPSVwIiwgc29jaywgb2xkc29jaywgaW5kZXgsIGZkLCB2cSk7
Cj4gIAkJdWJ1ZnMgPSB2aG9zdF9uZXRfdWJ1Zl9hbGxvYyh2cSwKPiAgCQkJCQkgICAgIHNvY2sg
JiYgdmhvc3Rfc29ja196Y29weShzb2NrKSk7Cj4gIAkJaWYgKElTX0VSUih1YnVmcykpIHsKPiAg
CQkJciA9IFBUUl9FUlIodWJ1ZnMpOwo+ICsJCQlwcl9kZWJ1ZygidWJ1ZnMgaW5kZXg9JXUgZmQ9
JWQgZXJyIHI9JWQgdnE9JXAiLCBpbmRleCwgZmQsIHIsIHZxKTsKPiAgCQkJZ290byBlcnJfdWJ1
ZnM7Cj4gIAkJfQo+ICAKPiBAQCAtMTU0MSwxMSArMTU0OCwxNSBAQCBzdGF0aWMgbG9uZyB2aG9z
dF9uZXRfc2V0X2JhY2tlbmQoc3RydWN0IHZob3N0X25ldCAqbiwgdW5zaWduZWQgaW5kZXgsIGlu
dCBmZCkKPiAgCQl2cS0+cHJpdmF0ZV9kYXRhID0gc29jazsKPiAgCQl2aG9zdF9uZXRfYnVmX3Vu
cHJvZHVjZShudnEpOwo+ICAJCXIgPSB2aG9zdF92cV9pbml0X2FjY2Vzcyh2cSk7Cj4gLQkJaWYg
KHIpCj4gKwkJaWYgKHIpIHsKPiArCQkJcHJfZGVidWcoImluaXRfYWNjZXNzIGluZGV4PSV1IGZk
PSVkIHI9JWQgdnE9JXAiLCBpbmRleCwgZmQsIHIsIHZxKTsKPiAgCQkJZ290byBlcnJfdXNlZDsK
PiArCQl9Cj4gIAkJciA9IHZob3N0X25ldF9lbmFibGVfdnEobiwgdnEpOwo+IC0JCWlmIChyKQo+
ICsJCWlmIChyKSB7Cj4gKwkJCXByX2RlYnVnKCJlbmFibGVfdnEgaW5kZXg9JXUgZmQ9JWQgcj0l
ZCB2cT0lcCIsIGluZGV4LCBmZCwgciwgdnEpOwo+ICAJCQlnb3RvIGVycl91c2VkOwo+ICsJCX0K
PiAgCQlpZiAoaW5kZXggPT0gVkhPU1RfTkVUX1ZRX1JYKQo+ICAJCQludnEtPnJ4X3JpbmcgPSBn
ZXRfdGFwX3B0cl9yaW5nKGZkKTsKPiAgCj4gQEAgLTE1NTksNiArMTU3MCw4IEBAIHN0YXRpYyBs
b25nIHZob3N0X25ldF9zZXRfYmFja2VuZChzdHJ1Y3Qgdmhvc3RfbmV0ICpuLCB1bnNpZ25lZCBp
bmRleCwgaW50IGZkKQo+ICAKPiAgCW11dGV4X3VubG9jaygmdnEtPm11dGV4KTsKPiAgCj4gKwlw
cl9kZWJ1Zygic29jaz0lcCIsIHNvY2spOwo+ICsKPiAgCWlmIChvbGR1YnVmcykgewo+ICAJCXZo
b3N0X25ldF91YnVmX3B1dF93YWl0X2FuZF9mcmVlKG9sZHVidWZzKTsKPiAgCQltdXRleF9sb2Nr
KCZ2cS0+bXV0ZXgpOwo+IEBAIC0xNzEwLDYgKzE3MjMsNyBAQCBzdGF0aWMgbG9uZyB2aG9zdF9u
ZXRfaW9jdGwoc3RydWN0IGZpbGUgKmYsIHVuc2lnbmVkIGludCBpb2N0bCwKPiAgCj4gIAlzd2l0
Y2ggKGlvY3RsKSB7Cj4gIAljYXNlIFZIT1NUX05FVF9TRVRfQkFDS0VORDoKPiArCQlwcl9kZWJ1
ZygiVkhPU1RfTkVUX1NFVF9CQUNLRU5EIik7Cj4gIAkJaWYgKGNvcHlfZnJvbV91c2VyKCZiYWNr
ZW5kLCBhcmdwLCBzaXplb2YgYmFja2VuZCkpCj4gIAkJCXJldHVybiAtRUZBVUxUOwo+ICAJCXJl
dHVybiB2aG9zdF9uZXRfc2V0X2JhY2tlbmQobiwgYmFja2VuZC5pbmRleCwgYmFja2VuZC5mZCk7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhv
c3QuYwo+IGluZGV4IDAyMWQ3MGJlZDAxNS4uN2Y0ODQ4ZjljZWMzIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmhvc3Qvdmhvc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IEBAIC0x
NjQyLDE4ICsxNjQyLDMwIEBAIGxvbmcgdmhvc3RfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X2Rl
diAqZCwgdW5zaWduZWQgaW50IGlvY3RsLCB2b2lkIF9fdXNlciAqYXJnCj4gIAkJCXIgPSAtRUlO
VkFMOwo+ICAJCQlicmVhazsKPiAgCQl9Cj4gKwo+ICsJCWlmICh2cS0+bGFzdF9hdmFpbF9pZHgg
fHwgdnEtPmF2YWlsX2lkeCkgewo+ICsJCQlwcl9kZWJ1ZygKPiArCQkJCSJzdHJhbmdlIFZIT1NU
X1NFVF9WUklOR19CQVNFIFt2cT0lcF1bcy5pbmRleD0ldV1bcy5udW09JXVdIiwKPiArCQkJCXZx
LCBzLmluZGV4LCBzLm51bSk7Cj4gKwkJCWR1bXBfc3RhY2soKTsKPiArCQkJciA9IDA7Cj4gKwkJ
CWJyZWFrOwo+ICsJCX0KPiAgCQl2cS0+bGFzdF9hdmFpbF9pZHggPSBzLm51bTsKPiAgCQkvKiBG
b3JnZXQgdGhlIGNhY2hlZCBpbmRleCB2YWx1ZS4gKi8KPiAgCQl2cS0+YXZhaWxfaWR4ID0gdnEt
Pmxhc3RfYXZhaWxfaWR4Owo+ICAJCXByX2RlYnVnKAo+IC0JCQkiVkhPU1RfU0VUX1ZSSU5HX0JB
U0UgW3ZxPSVwXVt2cS0+bGFzdF9hdmFpbF9pZHg9JXVdW3ZxLT5hdmFpbF9pZHg9JXVdIiwKPiAt
CQkJdnEsIHZxLT5sYXN0X2F2YWlsX2lkeCwgdnEtPmF2YWlsX2lkeCk7Cj4gKwkJCSJWSE9TVF9T
RVRfVlJJTkdfQkFTRSBbdnE9JXBdW3ZxLT5sYXN0X2F2YWlsX2lkeD0ldV1bdnEtPmF2YWlsX2lk
eD0ldV1bcy5pbmRleD0ldV1bcy5udW09JXVdIiwKPiArCQkJdnEsIHZxLT5sYXN0X2F2YWlsX2lk
eCwgdnEtPmF2YWlsX2lkeCwgcy5pbmRleCwgcy5udW0pOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBW
SE9TVF9HRVRfVlJJTkdfQkFTRToKPiAgCQlzLmluZGV4ID0gaWR4Owo+ICAJCXMubnVtID0gdnEt
Pmxhc3RfYXZhaWxfaWR4Owo+ICAJCWlmIChjb3B5X3RvX3VzZXIoYXJncCwgJnMsIHNpemVvZiBz
KSkKPiAgCQkJciA9IC1FRkFVTFQ7Cj4gKwkJcHJfZGVidWcoCj4gKwkJCSJWSE9TVF9HRVRfVlJJ
TkdfQkFTRSBbdnE9JXBdW3ZxLT5sYXN0X2F2YWlsX2lkeD0ldV1bdnEtPmF2YWlsX2lkeD0ldV1b
cy5pbmRleD0ldV1bcy5udW09JXVdIiwKPiArCQkJdnEsIHZxLT5sYXN0X2F2YWlsX2lkeCwgdnEt
PmF2YWlsX2lkeCwgcy5pbmRleCwgcy5udW0pOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBWSE9TVF9T
RVRfVlJJTkdfS0lDSzoKPiAgCQlpZiAoY29weV9mcm9tX3VzZXIoJmYsIGFyZ3AsIHNpemVvZiBm
KSkgewo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
