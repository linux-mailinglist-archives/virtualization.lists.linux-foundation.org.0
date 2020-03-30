Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 080361975CC
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 09:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8DF268762A;
	Mon, 30 Mar 2020 07:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-oW+w+jaNzi; Mon, 30 Mar 2020 07:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 972F3876F6;
	Mon, 30 Mar 2020 07:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E2D1C07FF;
	Mon, 30 Mar 2020 07:34:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B02BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EDDAB85F8A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7-Js6kJbjWJ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:34:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B32D4850E1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 07:34:31 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U7WucG106146 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 03:34:30 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303bgdhk8c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 03:34:30 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Mon, 30 Mar 2020 08:34:27 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 08:34:23 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02U7XKhM46203184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 07:33:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82E984C05A;
 Mon, 30 Mar 2020 07:34:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0242D4C050;
 Mon, 30 Mar 2020 07:34:23 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.3.56])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 07:34:22 +0000 (GMT)
Subject: Re: [PATCH 0/6] vhost: Reset batched descriptors on SET_VRING_BASE
 call
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20200329113359.30960-1-eperezma@redhat.com>
 <bb95e827-f219-32fd-0046-41046eec058b@de.ibm.com>
 <CAJaqyWePfMcXhYEPxKYV22J3cYtO=DUXCj1Yf=7XH+khXHop9A@mail.gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Mon, 30 Mar 2020 09:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWePfMcXhYEPxKYV22J3cYtO=DUXCj1Yf=7XH+khXHop9A@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20033007-0028-0000-0000-000003EE85D0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033007-0029-0000-0000-000024B40335
Message-Id: <41dfa0e5-8013-db15-cbfe-aa4574cfb9a0@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300067
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

CgpPbiAzMC4wMy4yMCAwOToxOCwgRXVnZW5pbyBQZXJleiBNYXJ0aW4gd3JvdGU6Cj4gT24gTW9u
LCBNYXIgMzAsIDIwMjAgYXQgOToxNCBBTSBDaHJpc3RpYW4gQm9ybnRyYWVnZXIKPiA8Ym9ybnRy
YWVnZXJAZGUuaWJtLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IE9uIDI5LjAzLjIwIDEzOjMzLCBFdWdl
bmlvIFDDqXJleiB3cm90ZToKPj4+IFZob3N0IGRpZCBub3QgcmVzZXQgcHJvcGVybHkgdGhlIGJh
dGNoZWQgZGVzY3JpcHRvcnMgb24gU0VUX1ZSSU5HX0JBU0UgZXZlbnQuIEJlY2F1c2Ugb2YgdGhh
dCwgaXMgcG9zc2libGUgdG8gcmV0dXJuIGFuIGludmFsaWQgZGVzY3JpcHRvciB0byB0aGUgZ3Vl
c3QuCj4+Cj4+IEkgZ3Vlc3MgdGhpcyBjb3VsZCBleHBsYWluIG15IHByb2JsZW1zIHRoYXQgSSBo
YXZlIHNlZW4gZHVyaW5nIHJlc2V0Pwo+Pgo+IAo+IFllcywgSSB0aGluayBzby4gVGhlIHNlcmll
cyBoYXMgYSB0ZXN0IHRoYXQgc2hvdWxkIHJlcHJvZHVjZSBtb3JlIG9yCj4gbGVzcyB3aGF0IHlv
dSBhcmUgc2VlaW5nLiBIb3dldmVyLCBpdCB3b3VsZCBiZSB1c2VmdWwgdG8gcmVwcm9kdWNlIG9u
Cj4geW91ciBzeXN0ZW0gYW5kIHRvIGtub3cgd2hhdCBjYXVzZXMgcWVtdSB0byBzZW5kIHRoZSBy
ZXNldCA6KS4KCkkgZG8gc2VlIFNFVF9WUklOR19CQVNFIGluIHRoZSBkZWJ1ZyBvdXRwdXQKWzIy
ODEwMS40Mzg2MzBdIFsyMTEzXSB2aG9zdDp2aG9zdF92cmluZ19pb2N0bDoxNjY4OiBWSE9TVF9H
RVRfVlJJTkdfQkFTRSBbdnE9MDAwMDAwMDA2MTg5MDVmY11bcy5pbmRleD0xXVtzLm51bT00MjQy
NF1bdnEtPmF2YWlsX2lkeD00MjQyNF1bdnEtPmxhc3RfYXZhaWxfaWR4PTQyNDI0XVt2cS0+bmRl
c2NzPTBdW3ZxLT5maXJzdF9kZXNjPTBdClsyMjgxMDEuNDM4NjMxXSBDUFU6IDU0IFBJRDogMjEx
MyBDb21tOiBxZW11LXN5c3RlbS1zMzkgTm90IHRhaW50ZWQgNS41LjArICMzNDQKWzIyODEwMS40
Mzg2MzJdIEhhcmR3YXJlIG5hbWU6IElCTSAzOTA2IE0wNCA3MDQgKExQQVIpClsyMjgxMDEuNDM4
NjMzXSBDYWxsIFRyYWNlOgpbMjI4MTAxLjQzODYzNF0gIFs8MDAwMDAwMDRmYzcxYzEzMj5dIHNo
b3dfc3RhY2srMHg4YS8weGQwIApbMjI4MTAxLjQzODYzNl0gIFs8MDAwMDAwMDRmZDEwZTcyYT5d
IGR1bXBfc3RhY2srMHg4YS8weGI4IApbMjI4MTAxLjQzODYzOV0gIFs8MDAwMDAzZmY4MDM3NzYw
MD5dIHZob3N0X3ZyaW5nX2lvY3RsKzB4NjY4LzB4ODQ4IFt2aG9zdF0gClsyMjgxMDEuNDM4NjQw
XSAgWzwwMDAwMDNmZjgwMzk1ZmQ0Pl0gdmhvc3RfbmV0X2lvY3RsKzB4NGY0LzB4NTcwIFt2aG9z
dF9uZXRdIApbMjI4MTAxLjQzODY0Ml0gIFs8MDAwMDAwMDRmYzljY2RkOD5dIGRvX3Zmc19pb2N0
bCsweDQzMC8weDZmOCAKWzIyODEwMS40Mzg2NDNdICBbPDAwMDAwMDA0ZmM5Y2QxMjQ+XSBrc3lz
X2lvY3RsKzB4ODQvMHhiMCAKWzIyODEwMS40Mzg2NDVdICBbPDAwMDAwMDA0ZmM5Y2QxYmE+XSBf
X3MzOTB4X3N5c19pb2N0bCsweDJhLzB4MzggClsyMjgxMDEuNDM4NjQ2XSAgWzwwMDAwMDAwNGZk
MTJmZjcyPl0gc3lzdGVtX2NhbGwrMHgyYTYvMHgyYzggClsyMjgxMDMuNjgyNzMyXSBbMjEyMl0g
dmhvc3Q6dmhvc3RfdnJpbmdfaW9jdGw6MTY1MzogVkhPU1RfU0VUX1ZSSU5HX0JBU0UgW3ZxPTAw
MDAwMDAwOWUxYWMzZTddW3MuaW5kZXg9MF1bcy5udW09MF1bdnEtPmF2YWlsX2lkeD0yNzg3NV1b
dnEtPmxhc3RfYXZhaWxfaWR4PTI3NzA5XVt2cS0+bmRlc2NzPTY1XVt2cS0+Zmlyc3RfZGVzYz0y
Ml0KWzIyODEwMy42ODI3MzVdIENQVTogNDQgUElEOiAyMTIyIENvbW06IENQVSAwL0tWTSBOb3Qg
dGFpbnRlZCA1LjUuMCsgIzM0NApbMjI4MTAzLjY4MjczOV0gSGFyZHdhcmUgbmFtZTogSUJNIDM5
MDYgTTA0IDcwNCAoTFBBUikKWzIyODEwMy42ODI3NDFdIENhbGwgVHJhY2U6ClsyMjgxMDMuNjgy
NzQ4XSAgWzwwMDAwMDAwNGZjNzFjMTMyPl0gc2hvd19zdGFjaysweDhhLzB4ZDAgClsyMjgxMDMu
NjgyNzUyXSAgWzwwMDAwMDAwNGZkMTBlNzJhPl0gZHVtcF9zdGFjaysweDhhLzB4YjggClsyMjgx
MDMuNjgyNzYxXSAgWzwwMDAwMDNmZjgwMzc3NDIyPl0gdmhvc3RfdnJpbmdfaW9jdGwrMHg0OGEv
MHg4NDggW3Zob3N0XSAKWzIyODEwMy42ODI3NjRdICBbPDAwMDAwM2ZmODAzOTVmZDQ+XSB2aG9z
dF9uZXRfaW9jdGwrMHg0ZjQvMHg1NzAgW3Zob3N0X25ldF0gClsyMjgxMDMuNjgyNzY3XSAgWzww
MDAwMDAwNGZjOWNjZGQ4Pl0gZG9fdmZzX2lvY3RsKzB4NDMwLzB4NmY4IApbMjI4MTAzLjY4Mjc2
OV0gIFs8MDAwMDAwMDRmYzljZDEyND5dIGtzeXNfaW9jdGwrMHg4NC8weGIwIApbMjI4MTAzLjY4
Mjc3MV0gIFs8MDAwMDAwMDRmYzljZDFiYT5dIF9fczM5MHhfc3lzX2lvY3RsKzB4MmEvMHgzOCAK
WzIyODEwMy42ODI3NzNdICBbPDAwMDAwMDA0ZmQxMmZmNzI+XSBzeXN0ZW1fY2FsbCsweDJhNi8w
eDJjOCAKWzIyODEwMy42ODI3OTRdIFsyMTIyXSB2aG9zdDp2aG9zdF92cmluZ19pb2N0bDoxNjUz
OiBWSE9TVF9TRVRfVlJJTkdfQkFTRSBbdnE9MDAwMDAwMDA2MTg5MDVmY11bcy5pbmRleD0xXVtz
Lm51bT0wXVt2cS0+YXZhaWxfaWR4PTQyNDI0XVt2cS0+bGFzdF9hdmFpbF9pZHg9NDI0MjRdW3Zx
LT5uZGVzY3M9MF1bdnEtPmZpcnN0X2Rlc2M9MF0KWzIyODEwMy42ODI3OTVdIENQVTogNDQgUElE
OiAyMTIyIENvbW06IENQVSAwL0tWTSBOb3QgdGFpbnRlZCA1LjUuMCsgIzM0NApbMjI4MTAzLjY4
Mjc5N10gSGFyZHdhcmUgbmFtZTogSUJNIDM5MDYgTTA0IDcwNCAoTFBBUikKWzIyODEwMy42ODI3
OTddIENhbGwgVHJhY2U6ClsyMjgxMDMuNjgyNzk5XSAgWzwwMDAwMDAwNGZjNzFjMTMyPl0gc2hv
d19zdGFjaysweDhhLzB4ZDAgClsyMjgxMDMuNjgyODAxXSAgWzwwMDAwMDAwNGZkMTBlNzJhPl0g
ZHVtcF9zdGFjaysweDhhLzB4YjggClsyMjgxMDMuNjgyODA0XSAgWzwwMDAwMDNmZjgwMzc3NDIy
Pl0gdmhvc3RfdnJpbmdfaW9jdGwrMHg0OGEvMHg4NDggW3Zob3N0XSAKWzIyODEwMy42ODI4MDZd
ICBbPDAwMDAwM2ZmODAzOTVmZDQ+XSB2aG9zdF9uZXRfaW9jdGwrMHg0ZjQvMHg1NzAgW3Zob3N0
X25ldF0gClsyMjgxMDMuNjgyODA4XSAgWzwwMDAwMDAwNGZjOWNjZGQ4Pl0gZG9fdmZzX2lvY3Rs
KzB4NDMwLzB4NmY4IApbMjI4MTAzLjY4MjgxMF0gIFs8MDAwMDAwMDRmYzljZDEyND5dIGtzeXNf
aW9jdGwrMHg4NC8weGIwIApbMjI4MTAzLjY4MjgxMl0gIFs8MDAwMDAwMDRmYzljZDFiYT5dIF9f
czM5MHhfc3lzX2lvY3RsKzB4MmEvMHgzOCAKWzIyODEwMy42ODI4MTNdICBbPDAwMDAwMDA0ZmQx
MmZmNzI+XSBzeXN0ZW1fY2FsbCsweDJhNi8weDJjOCAKCgpJc250IHRoYXQgdHJpZ2dlcmVkIGJ5
IHJlc2V0dGluZyB0aGUgdmlydGlvIGRldmljZXMgZHVyaW5nIHN5c3RlbSByZWJvb3Q/CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
