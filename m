Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBEC19AC52
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 15:02:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C80988163;
	Wed,  1 Apr 2020 13:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUrs8JVm+ZVQ; Wed,  1 Apr 2020 13:02:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E8C938815D;
	Wed,  1 Apr 2020 13:02:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4C94C089F;
	Wed,  1 Apr 2020 13:02:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA469C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E530E85DE1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yp7NxlZXfhPu
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:02:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D3A9985DDB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:02:49 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031D2bRi096244
 for <virtualization@lists.linux-foundation.org>; Wed, 1 Apr 2020 09:02:48 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304swrtytp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 09:02:48 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Wed, 1 Apr 2020 14:01:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 14:01:49 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031D22HY48693250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 13:02:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5B6A5204E;
 Wed,  1 Apr 2020 13:02:02 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.71.143])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 46B925204F;
 Wed,  1 Apr 2020 13:02:01 +0000 (GMT)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Wed, 1 Apr 2020 15:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040113-0016-0000-0000-000002FC566D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040113-0017-0000-0000-000033601B0C
Message-Id: <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010113
Cc: mhabets@solarflare.com, rob.miller@broadcom.com, saugatm@xilinx.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, rdunlap@infradead.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

CgpPbiAwMS4wNC4yMCAxNDo1NiwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+IAo+IE9u
IDAxLjA0LjIwIDE0OjUwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDIwLzQvMSDkuIvl
jYg3OjIxLCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4+PiBPbiAyNi4wMy4yMCAxNTow
MSwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiBDdXJyZW50bHksIENPTkZJR19WSE9TVCBkZXBlbmRz
IG9uIENPTkZJR19WSVJUVUFMSVpBVElPTi4gQnV0IHZob3N0IGlzCj4+Pj4gbm90IG5lY2Vzc2Fy
aWx5IGZvciBWTSBzaW5jZSBpdCdzIGEgZ2VuZXJpYyB1c2Vyc3BhY2UgYW5kIGtlcm5lbAo+Pj4+
IGNvbW11bmljYXRpb24gcHJvdG9jb2wuIFN1Y2ggZGVwZW5kZW5jeSBtYXkgcHJldmVudCBhcmNo
cyB3aXRob3V0Cj4+Pj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBmcm9tIHVzaW5nIHZob3N0Lgo+
Pj4+Cj4+Pj4gVG8gc29sdmUgdGhpcywgYSBkZWRpY2F0ZWQgdmhvc3QgbWVudSBpcyBjcmVhdGVk
IHVuZGVyIGRyaXZlcnMgc28KPj4+PiBDT05JRkdfVkhPU1QgY2FuIGJlIGRlY291cGxlZCBvdXQg
b2YgQ09ORklHX1ZJUlRVQUxJWkFUSU9OLgo+Pj4gRldJVywgdGhpcyBub3cgcmVzdWx0cyBpbiB2
aG9zdCBub3QgYmVpbmcgYnVpbGQgd2l0aCBkZWZjb25maWcga2VybmVscyAoaW4gdG9kYXlzCj4+
PiBsaW51eC1uZXh0KS4KPj4+Cj4+Cj4+IEhpIENocmlzdGlhbjoKPj4KPj4gRGlkIHlvdSBtZWV0
IGl0IGV2ZW4gd2l0aCB0aGlzIGNvbW1pdMKgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPWE0YmU0MGNi
Y2VkYmE5YjViNzE0ZjNjOTUxODJlOGE0NTE3NmU0MmQ/Cj4gCj4gSSBzaW1wbHkgdXNlZCBsaW51
eC1uZXh0LiBUaGUgZGVmY29uZmlnIGRvZXMgTk9UIGNvbnRhaW4gQ09ORklHX1ZIT1NUIGFuZCB0
aGVyZWZvcmUgQ09ORklHX1ZIT1NUX05FVCBhbmQgZnJpZW5kcwo+IGNhbiBub3QgYmUgc2VsZWN0
ZWQuCj4gCj4gJCBnaXQgY2hlY2tvdXQgbmV4dC0yMDIwMDQwMQo+ICQgbWFrZSBkZWZjb25maWcK
PiAgIEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9maXhkZXAKPiAgIEhPU1RDQyAgc2NyaXB0cy9rY29u
ZmlnL2NvbmYubwo+ICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvY29uZmRhdGEubwo+ICAgSE9T
VENDICBzY3JpcHRzL2tjb25maWcvZXhwci5vCj4gICBMRVggICAgIHNjcmlwdHMva2NvbmZpZy9s
ZXhlci5sZXguYwo+ICAgWUFDQyAgICBzY3JpcHRzL2tjb25maWcvcGFyc2VyLnRhYi5bY2hdCj4g
ICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9sZXhlci5sZXgubwo+ICAgSE9TVENDICBzY3JpcHRz
L2tjb25maWcvcGFyc2VyLnRhYi5vCj4gICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wcmVwcm9j
ZXNzLm8KPiAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5vCj4gICBIT1NUQ0MgIHNj
cmlwdHMva2NvbmZpZy91dGlsLm8KPiAgIEhPU1RMRCAgc2NyaXB0cy9rY29uZmlnL2NvbmYKPiAq
KiogRGVmYXVsdCBjb25maWd1cmF0aW9uIGlzIGJhc2VkIG9uICd4ODZfNjRfZGVmY29uZmlnJwo+
ICMKPiAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0byAuY29uZmlnCj4gIwo+IAo+ICQgZ3JlcCBW
SE9TVCAuY29uZmlnCj4gIyBDT05GSUdfVkhPU1QgaXMgbm90IHNldAo+IAo+ICAKPj4gSWYgeWVz
LCB3aGF0J3MgeW91ciBidWlsZCBjb25maWcgbG9va3MgbGlrZT8KPj4KPj4gVGhhbmtzCgpUaGlz
IHdhcyB4ODYuIE5vdCBzdXJlIGlmIHRoYXQgZGlkIHdvcmsgYmVmb3JlLgpPbiBzMzkwIHRoaXMg
aXMgZGVmaW5pdGVseSBhIHJlZ3Jlc3Npb24gYXMgdGhlIGRlZmNvbmZpZyBmaWxlcyAKZm9yIHMz
OTAgZG8gc2VsZWN0IFZIT1NUX05FVAoKZ3JlcCBWSE9TVCBhcmNoL3MzOTAvY29uZmlncy8qCmFy
Y2gvczM5MC9jb25maWdzL2RlYnVnX2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfTkVUPW0KYXJjaC9z
MzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnOkNPTkZJR19WSE9TVF9WU09DSz1tCmFyY2gvczM5
MC9jb25maWdzL2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfTkVUPW0KYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVmY29uZmlnOkNPTkZJR19WSE9TVF9WU09DSz1tCgphbmQgdGhpcyB3b3JrZWQgd2l0aCA1LjYs
IGJ1dCBkb2VzIG5vdCB3b3JrIHdpdGggbmV4dC4gSnVzdCBhZGRpbmcKQ09ORklHX1ZIT1NUPW0g
dG8gdGhlIGRlZmNvbmZpZyBzb2x2ZXMgdGhlIGlzc3VlLCBzb21ldGhpbmcgbGlrZQoKLS0tCiBh
cmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcgfCA1ICsrKy0tCiBhcmNoL3MzOTAvY29u
Zmlncy9kZWZjb25maWcgICAgICAgfCA1ICsrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvY29uZmlncy9k
ZWJ1Z19kZWZjb25maWcgYi9hcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcKaW5kZXgg
NDYwMzhiYzU4YzllLi4wYjgzMjc0MzQxY2UgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9jb25maWdz
L2RlYnVnX2RlZmNvbmZpZworKysgYi9hcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWcK
QEAgLTU3LDggKzU3LDYgQEAgQ09ORklHX1BST1RFQ1RFRF9WSVJUVUFMSVpBVElPTl9HVUVTVD15
CiBDT05GSUdfQ01NPW0KIENPTkZJR19BUFBMREFUQV9CQVNFPXkKIENPTkZJR19LVk09bQotQ09O
RklHX1ZIT1NUX05FVD1tCi1DT05GSUdfVkhPU1RfVlNPQ0s9bQogQ09ORklHX09QUk9GSUxFPW0K
IENPTkZJR19LUFJPQkVTPXkKIENPTkZJR19KVU1QX0xBQkVMPXkKQEAgLTU2MSw2ICs1NTksOSBA
QCBDT05GSUdfVkZJT19NREVWX0RFVklDRT1tCiBDT05GSUdfVklSVElPX1BDST1tCiBDT05GSUdf
VklSVElPX0JBTExPT049bQogQ09ORklHX1ZJUlRJT19JTlBVVD15CitDT05GSUdfVkhPU1Q9bQor
Q09ORklHX1ZIT1NUX05FVD1tCitDT05GSUdfVkhPU1RfVlNPQ0s9bQogQ09ORklHX1MzOTBfQ0NX
X0lPTU1VPXkKIENPTkZJR19TMzkwX0FQX0lPTU1VPXkKIENPTkZJR19FWFQ0X0ZTPXkKZGlmZiAt
LWdpdCBhL2FyY2gvczM5MC9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvczM5MC9jb25maWdzL2Rl
ZmNvbmZpZwppbmRleCA3Y2QwNjQ4YzFmNGUuLjM5ZTY5YzRlOGNmNyAxMDA2NDQKLS0tIGEvYXJj
aC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnCisrKyBiL2FyY2gvczM5MC9jb25maWdzL2RlZmNvbmZp
ZwpAQCAtNTcsOCArNTcsNiBAQCBDT05GSUdfUFJPVEVDVEVEX1ZJUlRVQUxJWkFUSU9OX0dVRVNU
PXkKIENPTkZJR19DTU09bQogQ09ORklHX0FQUExEQVRBX0JBU0U9eQogQ09ORklHX0tWTT1tCi1D
T05GSUdfVkhPU1RfTkVUPW0KLUNPTkZJR19WSE9TVF9WU09DSz1tCiBDT05GSUdfT1BST0ZJTEU9
bQogQ09ORklHX0tQUk9CRVM9eQogQ09ORklHX0pVTVBfTEFCRUw9eQpAQCAtNTU3LDYgKzU1NSw5
IEBAIENPTkZJR19WRklPX01ERVZfREVWSUNFPW0KIENPTkZJR19WSVJUSU9fUENJPW0KIENPTkZJ
R19WSVJUSU9fQkFMTE9PTj1tCiBDT05GSUdfVklSVElPX0lOUFVUPXkKK0NPTkZJR19WSE9TVD1t
CitDT05GSUdfVkhPU1RfTkVUPW0KK0NPTkZJR19WSE9TVF9WU09DSz1tCiBDT05GSUdfUzM5MF9D
Q1dfSU9NTVU9eQogQ09ORklHX1MzOTBfQVBfSU9NTVU9eQogQ09ORklHX0VYVDRfRlM9eQotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
