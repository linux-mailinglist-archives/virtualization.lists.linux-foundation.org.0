Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0059B15D74E
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 13:23:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98E8686422;
	Fri, 14 Feb 2020 12:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjvUSumew0NT; Fri, 14 Feb 2020 12:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C32186375;
	Fri, 14 Feb 2020 12:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65F07C0177;
	Fri, 14 Feb 2020 12:22:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F813C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5E2C887C41
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZXPjBrHeDvu
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:22:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C31E85EE7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 12:22:54 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ECJO3X002334 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 07:22:53 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4j8cvk77-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 07:22:53 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Fri, 14 Feb 2020 12:22:51 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 12:22:48 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01ECMlxl42729754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 12:22:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98774AE057;
 Fri, 14 Feb 2020 12:22:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 501FDAE056;
 Fri, 14 Feb 2020 12:22:47 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.211])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 12:22:47 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20200107042401-mutt-send-email-mst@kernel.org>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com>
 <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
 <4c3f70b7-723a-8b0f-ac49-babef1bcc180@de.ibm.com>
 <50a79c3491ac483583c97df2fac29e2c3248fdea.camel@redhat.com>
 <8fbbfb49-99d1-7fee-e713-d6d5790fe866@de.ibm.com>
 <2364d0728c3bb4bcc0c13b591f774109a9274a30.camel@redhat.com>
 <bb9fb726-306c-5330-05aa-a86bd1b18097@de.ibm.com>
 <468983fad50a5e74a739f71487f0ea11e8d4dfd1.camel@redhat.com>
 <2dc1df65-1431-3917-40e5-c2b12096e2a7@de.ibm.com>
 <bd9c9b4d99abd20d5420583af5a4954ea1cf4618.camel@redhat.com>
 <e11ba53c-a5fa-0518-2e06-9296897ed529@de.ibm.com>
 <CAJaqyWfJFArAdpOwehTn5ci-frqai+pazGgcn2VvQSebqGRVtg@mail.gmail.com>
 <80520391-d90d-e10d-a107-7a18f2810900@de.ibm.com>
 <dabe59fe-e068-5935-f49e-bc1da3d8471a@de.ibm.com>
 <35dca16b9a85eb203f35d3e55dcaa9d0dae5a922.camel@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Fri, 14 Feb 2020 13:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <35dca16b9a85eb203f35d3e55dcaa9d0dae5a922.camel@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20021412-0016-0000-0000-000002E6C505
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021412-0017-0000-0000-00003349CC77
Message-Id: <3144806d-436e-86a1-2e29-74f7027f7f0b@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140102
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

CgpPbiAxNC4wMi4yMCAxMzoxNywgRXVnZW5pbyBQw6lyZXogd3JvdGU6Cj4gQ2FuIHlvdSB0cnkg
dGhlIGlubGluZWQgcGF0Y2ggb3ZlciA1MmMzNmNlN2YzMzQgKCJ2aG9zdDogdXNlIGJhdGNoZWQg
dmVyc2lvbiBieSBkZWZhdWx0Iik/IE15IGludGVudGlvbiBpcyB0byBjaGVjayBpZgo+ICJzdHJh
bmdlIFZIT1NUX1NFVF9WUklOR19CQVNFIiBsaW5lIGFwcGVhcnMuIEluIHByZXZpb3VzIHRlc3Rz
LCBpdCBhcHBlYXJzIHZlcnkgZmFzdCwgYnV0IG1heWJlIGl0IHRha2VzIHNvbWUgdGltZSBmb3IK
PiBpdCB0byBhcHBlYXIsIG9yIGl0IGRvZXMgbm90IGFwcGVhciBhbnltb3JlLgoKICBMRCBbTV0g
IGRyaXZlcnMvdmhvc3Qvdmhvc3RfdnNvY2subwogIENDIFtNXSAgZHJpdmVycy92aG9zdC92aG9z
dC5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgvcHJpbnRrLmg6MzMxLAog
ICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjE1LAogICAgICAg
ICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2xpc3QuaDo5LAogICAgICAgICAgICAgICAg
IGZyb20gLi9pbmNsdWRlL2xpbnV4L3dhaXQuaDo3LAogICAgICAgICAgICAgICAgIGZyb20gLi9p
bmNsdWRlL2xpbnV4L2V2ZW50ZmQuaDoxMywKICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMv
dmhvc3Qvdmhvc3QuYzoxMzoKZHJpdmVycy92aG9zdC92aG9zdC5jOiBJbiBmdW5jdGlvbiDigJhm
ZXRjaF9kZXNjc+KAmToKZHJpdmVycy92aG9zdC92aG9zdC5jOjIzMzA6NTY6IGVycm9yOiDigJhz
dHJ1Y3Qgdmhvc3RfdmlydHF1ZXVl4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYZmlyc3RfZGVz
Y+KAmQogMjMzMCB8ICAgdnEsIHZxLT5sYXN0X2F2YWlsX2lkeCwgdnEtPmF2YWlsX2lkeCwgdnEt
Pm5kZXNjcywgdnEtPmZpcnN0X2Rlc2MpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgouL2luY2x1ZGUvbGludXgvZHluYW1p
Y19kZWJ1Zy5oOjEyNToxNTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2R5bmFt
aWNfZnVuY19jYWxs4oCZCiAgMTI1IHwgICBmdW5jKCZpZCwgIyNfX1ZBX0FSR1NfXyk7ICBcCiAg
ICAgIHwgICAgICAgICAgICAgICBefn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvZHluYW1pY19k
ZWJ1Zy5oOjE1MzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX2R5bmFtaWNfZnVu
Y19jYWxs4oCZCiAgMTUzIHwgIF9keW5hbWljX2Z1bmNfY2FsbChmbXQsIF9fZHluYW1pY19wcl9k
ZWJ1ZywgIFwKICAgICAgfCAgXn5+fn5+fn5+fn5+fn5+fn5+Ci4vaW5jbHVkZS9saW51eC9wcmlu
dGsuaDozMzU6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGR5bmFtaWNfcHJfZGVi
dWfigJkKICAzMzUgfCAgZHluYW1pY19wcl9kZWJ1ZyhmbXQsICMjX19WQV9BUkdTX18pCiAgICAg
IHwgIF5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy92aG9zdC92aG9zdC5jOjIzMjg6Mjogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHByX2RlYnVn4oCZCiAyMzI4IHwgIHByX2RlYnVnKAog
ICAgICB8ICBefn5+fn5+fgptYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjY2
OiBkcml2ZXJzL3Zob3N0L3Zob3N0Lm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjUwMzogZHJpdmVycy92aG9zdF0gRXJyb3IgMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
