Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF0F13230E
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 10:56:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD9382034C;
	Tue,  7 Jan 2020 09:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJJTxkoECYlv; Tue,  7 Jan 2020 09:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 30C5E20243;
	Tue,  7 Jan 2020 09:56:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10B7BC0881;
	Tue,  7 Jan 2020 09:56:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84754C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 73B93840EA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQDVLiBYUnPZ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:56:30 +0000 (UTC)
X-Greylist: delayed 00:57:04 by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9148683448
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 09:56:30 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0078uxLI004215
 for <virtualization@lists.linux-foundation.org>; Tue, 7 Jan 2020 03:59:25 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xaq7xtutp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 03:59:25 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Tue, 7 Jan 2020 08:59:21 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Jan 2020 08:59:18 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0078xHWB46661654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 08:59:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E813A4054;
 Tue,  7 Jan 2020 08:59:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF622A405F;
 Tue,  7 Jan 2020 08:59:16 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 08:59:16 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <c022e1d6-0d57-ae07-5e6b-8e40d3b01f4b@de.ibm.com>
 <20191218100926-mutt-send-email-mst@kernel.org>
 <2ffdbd95-e375-a627-55a1-6990b0a0e37a@de.ibm.com>
 <20200106054041-mutt-send-email-mst@kernel.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Tue, 7 Jan 2020 09:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200106054041-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20010708-0012-0000-0000-0000037B1CF8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010708-0013-0000-0000-000021B737DF
Message-Id: <08ae8d28-3d8c-04e8-bdeb-0117d06c6dc7@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_02:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070073
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
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

CgpPbiAwNi4wMS4yMCAxMTo1MCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFdlZCwg
RGVjIDE4LCAyMDE5IGF0IDA0OjU5OjAyUE0gKzAxMDAsIENocmlzdGlhbiBCb3JudHJhZWdlciB3
cm90ZToKPj4gT24gMTguMTIuMTkgMTY6MTAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDAzOjQzOjQzUE0gKzAxMDAsIENocmlzdGlhbiBCb3Ju
dHJhZWdlciB3cm90ZToKPj4+PiBNaWNoYWVsLAo+Pj4+Cj4+Pj4gd2l0aCAKPj4+PiBjb21taXQg
ZGI3Mjg2YjEwMGI1MDNlZjgwNjEyODg0NDUzYmVkNTNkNzRjOWExNiAocmVmcy9iaXNlY3Qvc2tp
cC1kYjcyODZiMTAwYjUwM2VmODA2MTI4ODQ0NTNiZWQ1M2Q3NGM5YTE2KQo+Pj4+ICAgICB2aG9z
dDogdXNlIGJhdGNoZWQgdmVyc2lvbiBieSBkZWZhdWx0Cj4+Pj4gcGx1cwo+Pj4+IGNvbW1pdCA2
YmQyNjJkNWVhZmNkZjhjZGZhZTQ5MWUyZTc0OGU0ZTQzNGRjZGE2IChIRUFELCByZWZzL2Jpc2Vj
dC9iYWQpCj4+Pj4gICAgIFJldmVydCAidmhvc3QvbmV0OiBhZGQgYW4gb3B0aW9uIHRvIHRlc3Qg
bmV3IGNvZGUiCj4+Pj4gdG8gbWFrZSB0aGluZ3MgY29tcGlsZSAoeW91ciBuZXh0IHRyZWUgaXMg
bm90IGVhc2lseSBiaXNlY3RhYmxlLCBjYW4geW91IGZpeCB0aGF0IGFzIHdlbGw/KS4KPj4+Cj4+
PiBJJ2xsIHRyeS4KPj4+Cj4+Pj4KPj4+PiBJIGdldCByYW5kb20gY3Jhc2hlcyBpbiBteSBzMzkw
IEtWTSBndWVzdHMgYWZ0ZXIgcmVib290Lgo+Pj4+IFJldmVydGluZyBib3RoIHBhdGNoZXMgdG9n
ZXRoZXIgd2l0aCBjb21taXQgZGVjZDliOCAidmhvc3Q6IHVzZSB2aG9zdF9kZXNjIGluc3RlYWQg
b2Ygdmhvc3RfbG9nIiB0bwo+Pj4+IG1ha2UgaXQgY29tcGlsZSBhZ2Fpbikgb24gdG9wIG9mIGxp
bnV4LW5leHQtMTIxOCBtYWtlcyB0aGUgcHJvYmxlbSBnbyBhd2F5Lgo+Pj4+Cj4+Pj4gTG9va3Mg
bGlrZSB0aGUgYmF0Y2hlZCB2ZXJzaW9uIGlzIG5vdCB5ZXQgcmVhZHkgZm9yIHByaW1lIHRpbWUu
IENhbiB5b3UgZHJvcCB0aGVzZSBwYXRjaGVzIHVudGlsCj4+Pj4gd2UgaGF2ZSBmaXhlZCB0aGUg
aXNzdWVzPwo+Pj4+Cj4+Pj4gQ2hyaXN0aWFuCj4+Pj4KPj4+Cj4+PiBXaWxsIGRvLCB0aGFua3Mg
Zm9yIGxldHRpbmcgbWUga25vdy4KPj4KPj4gSSBoYXZlIGNvbmZpcm1lZCB3aXRoIHRoZSBpbml0
aWFsIHJlcG9ydGVyIChpbnRlcm5hbCB0ZXN0IHRlYW0pIHRoYXQgPGRyaXZlciBuYW1lPSdxZW11
Jy8+IAo+PiB3aXRoIGEga25vd24gdG8gYmUgYnJva2VuIGxpbnV4IG5leHQga2VybmVsIGFsc28g
Zml4ZXMgdGhlIHByb2JsZW0sIHNvIGl0IGlzIHJlYWxseSB0aGUKPj4gdmhvc3QgY2hhbmdlcy4K
PiAKPiBPSyBJJ20gYmFjayBhbmQgdHJ5aW5nIHRvIG1ha2UgaXQgbW9yZSBiaXNlY3RhYmxlLgo+
IAo+IEkgcHVzaGVkIGEgbmV3IHRhZyAiYmF0Y2gtdjIiLgo+IEl0J3Mgc2FtZSBjb2RlIGJ1dCB3
aXRoIHRoaXMgYmlzZWN0IHNob3VsZCBnZXQgbW9yZSBpbmZvcm1hdGlvbi4KCkkgZ2V0IHRoZSBm
b2xsb3dpbmcgd2l0aCB0aGlzIHRhZwoKZHJpdmVycy92aG9zdC9uZXQuYzogSW4gZnVuY3Rpb24g
4oCYdmhvc3RfbmV0X3R4X2dldF92cV9kZXNj4oCZOgpkcml2ZXJzL3Zob3N0L25ldC5jOjU3NDo3
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdmhvc3RfZ2V0X3Zx
X2Rlc2NfYmF0Y2jigJk7IGRpZCB5b3UgbWVhbiDigJh2aG9zdF9nZXRfdnFfZGVzY+KAmT8gWy1X
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgNTc0IHwgICByID0gdmhvc3Rf
Z2V0X3ZxX2Rlc2NfYmF0Y2godHZxLCB0dnEtPmlvdiwgQVJSQVlfU0laRSh0dnEtPmlvdiksCiAg
ICAgIHwgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAgICB2aG9zdF9n
ZXRfdnFfZGVzYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
