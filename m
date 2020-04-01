Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE4719B601
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 20:53:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1033A24C2A;
	Wed,  1 Apr 2020 18:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jjg39kJ9Bw2j; Wed,  1 Apr 2020 18:53:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27E7320784;
	Wed,  1 Apr 2020 18:53:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CD74C089F;
	Wed,  1 Apr 2020 18:53:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8EC2C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 18:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C7F3186C8D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 18:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEwd3FE6Sv_R
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 18:53:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EE58685DC0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 18:53:42 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031IZboA132928
 for <virtualization@lists.linux-foundation.org>; Wed, 1 Apr 2020 14:53:42 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g8m59n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 14:53:41 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Wed, 1 Apr 2020 19:53:23 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 19:53:15 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 031IqPUl47710512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 18:52:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A91C4C04E;
 Wed,  1 Apr 2020 18:53:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A59C64C046;
 Wed,  1 Apr 2020 18:53:25 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.71.143])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 18:53:25 +0000 (GMT)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
 <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
 <20200401102631-mutt-send-email-mst@kernel.org>
 <5e409bb4-2b06-5193-20c3-a9ddaafacf5a@redhat.com>
 <20200401115650-mutt-send-email-mst@kernel.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Wed, 1 Apr 2020 20:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200401115650-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040118-4275-0000-0000-000003B7C32C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040118-4276-0000-0000-000038CD1700
Message-Id: <cc3ef7f5-2980-00bf-2534-272b882bb64f@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=961 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010151
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
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

CgpPbiAwMS4wNC4yMCAxNzo1NywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9uIFdlZCwg
QXByIDAxLCAyMDIwIGF0IDEwOjUwOjUwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Cj4+
IE9uIDIwMjAvNC8xIOS4i+WNiDEwOjI3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIEFwciAwMSwgMjAyMCBhdCAxMDoxMzoyOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvNC8xIOS4i+WNiDk6MDIsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90
ZToKPj4+Pj4gT24gMDEuMDQuMjAgMTQ6NTYsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToK
Pj4+Pj4+IE9uIDAxLjA0LjIwIDE0OjUwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+IE9uIDIw
MjAvNC8xIOS4i+WNiDc6MjEsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPj4+Pj4+Pj4g
T24gMjYuMDMuMjAgMTU6MDEsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4+PiBDdXJyZW50bHks
IENPTkZJR19WSE9TVCBkZXBlbmRzIG9uIENPTkZJR19WSVJUVUFMSVpBVElPTi4gQnV0IHZob3N0
IGlzCj4+Pj4+Pj4+PiBub3QgbmVjZXNzYXJpbHkgZm9yIFZNIHNpbmNlIGl0J3MgYSBnZW5lcmlj
IHVzZXJzcGFjZSBhbmQga2VybmVsCj4+Pj4+Pj4+PiBjb21tdW5pY2F0aW9uIHByb3RvY29sLiBT
dWNoIGRlcGVuZGVuY3kgbWF5IHByZXZlbnQgYXJjaHMgd2l0aG91dAo+Pj4+Pj4+Pj4gdmlydHVh
bGl6YXRpb24gc3VwcG9ydCBmcm9tIHVzaW5nIHZob3N0Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRv
IHNvbHZlIHRoaXMsIGEgZGVkaWNhdGVkIHZob3N0IG1lbnUgaXMgY3JlYXRlZCB1bmRlciBkcml2
ZXJzIHNvCj4+Pj4+Pj4+PiBDT05JRkdfVkhPU1QgY2FuIGJlIGRlY291cGxlZCBvdXQgb2YgQ09O
RklHX1ZJUlRVQUxJWkFUSU9OLgo+Pj4+Pj4+PiBGV0lXLCB0aGlzIG5vdyByZXN1bHRzIGluIHZo
b3N0IG5vdCBiZWluZyBidWlsZCB3aXRoIGRlZmNvbmZpZyBrZXJuZWxzIChpbiB0b2RheXMKPj4+
Pj4+Pj4gbGludXgtbmV4dCkuCj4+Pj4+Pj4+Cj4+Pj4+Pj4gSGkgQ2hyaXN0aWFuOgo+Pj4+Pj4+
Cj4+Pj4+Pj4gRGlkIHlvdSBtZWV0IGl0IGV2ZW4gd2l0aCB0aGlzIGNvbW1pdMKgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0Lmdp
dC9jb21taXQvP2lkPWE0YmU0MGNiY2VkYmE5YjViNzE0ZjNjOTUxODJlOGE0NTE3NmU0MmQ/Cj4+
Pj4+PiBJIHNpbXBseSB1c2VkIGxpbnV4LW5leHQuIFRoZSBkZWZjb25maWcgZG9lcyBOT1QgY29u
dGFpbiBDT05GSUdfVkhPU1QgYW5kIHRoZXJlZm9yZSBDT05GSUdfVkhPU1RfTkVUIGFuZCBmcmll
bmRzCj4+Pj4+PiBjYW4gbm90IGJlIHNlbGVjdGVkLgo+Pj4+Pj4KPj4+Pj4+ICQgZ2l0IGNoZWNr
b3V0IG5leHQtMjAyMDA0MDEKPj4+Pj4+ICQgbWFrZSBkZWZjb25maWcKPj4+Pj4+ICAgICBIT1NU
Q0MgIHNjcmlwdHMvYmFzaWMvZml4ZGVwCj4+Pj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25m
aWcvY29uZi5vCj4+Pj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvY29uZmRhdGEubwo+
Pj4+Pj4gICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2V4cHIubwo+Pj4+Pj4gICAgIExFWCAg
ICAgc2NyaXB0cy9rY29uZmlnL2xleGVyLmxleC5jCj4+Pj4+PiAgICAgWUFDQyAgICBzY3JpcHRz
L2tjb25maWcvcGFyc2VyLnRhYi5bY2hdCj4+Pj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25m
aWcvbGV4ZXIubGV4Lm8KPj4+Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wYXJzZXIu
dGFiLm8KPj4+Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wcmVwcm9jZXNzLm8KPj4+
Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9zeW1ib2wubwo+Pj4+Pj4gICAgIEhPU1RD
QyAgc2NyaXB0cy9rY29uZmlnL3V0aWwubwo+Pj4+Pj4gICAgIEhPU1RMRCAgc2NyaXB0cy9rY29u
ZmlnL2NvbmYKPj4+Pj4+ICoqKiBEZWZhdWx0IGNvbmZpZ3VyYXRpb24gaXMgYmFzZWQgb24gJ3g4
Nl82NF9kZWZjb25maWcnCj4+Pj4+PiAjCj4+Pj4+PiAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0
byAuY29uZmlnCj4+Pj4+PiAjCj4+Pj4+Pgo+Pj4+Pj4gJCBncmVwIFZIT1NUIC5jb25maWcKPj4+
Pj4+ICMgQ09ORklHX1ZIT1NUIGlzIG5vdCBzZXQKPj4+Pj4+Cj4+Pj4+Pj4gSWYgeWVzLCB3aGF0
J3MgeW91ciBidWlsZCBjb25maWcgbG9va3MgbGlrZT8KPj4+Pj4+Pgo+Pj4+Pj4+IFRoYW5rcwo+
Pj4+PiBUaGlzIHdhcyB4ODYuIE5vdCBzdXJlIGlmIHRoYXQgZGlkIHdvcmsgYmVmb3JlLgo+Pj4+
PiBPbiBzMzkwIHRoaXMgaXMgZGVmaW5pdGVseSBhIHJlZ3Jlc3Npb24gYXMgdGhlIGRlZmNvbmZp
ZyBmaWxlcwo+Pj4+PiBmb3IgczM5MCBkbyBzZWxlY3QgVkhPU1RfTkVUCj4+Pj4+Cj4+Pj4+IGdy
ZXAgVkhPU1QgYXJjaC9zMzkwL2NvbmZpZ3MvKgo+Pj4+PiBhcmNoL3MzOTAvY29uZmlncy9kZWJ1
Z19kZWZjb25maWc6Q09ORklHX1ZIT1NUX05FVD1tCj4+Pj4+IGFyY2gvczM5MC9jb25maWdzL2Rl
YnVnX2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfVlNPQ0s9bQo+Pj4+PiBhcmNoL3MzOTAvY29uZmln
cy9kZWZjb25maWc6Q09ORklHX1ZIT1NUX05FVD1tCj4+Pj4+IGFyY2gvczM5MC9jb25maWdzL2Rl
ZmNvbmZpZzpDT05GSUdfVkhPU1RfVlNPQ0s9bQo+Pj4+Pgo+Pj4+PiBhbmQgdGhpcyB3b3JrZWQg
d2l0aCA1LjYsIGJ1dCBkb2VzIG5vdCB3b3JrIHdpdGggbmV4dC4gSnVzdCBhZGRpbmcKPj4+Pj4g
Q09ORklHX1ZIT1NUPW0gdG8gdGhlIGRlZmNvbmZpZyBzb2x2ZXMgdGhlIGlzc3VlLCBzb21ldGhp
bmcgbGlrZQo+Pj4+Cj4+Pj4gUmlnaHQsIEkgdGhpbmsgd2UgcHJvYmFibHkgbmVlZAo+Pj4+Cj4+
Pj4gMSkgYWRkIENPTkZJR19WSE9TVD1tIHRvIGFsbCBkZWZjb25maWdzIHRoYXQgZW5hYmxlcwo+
Pj4+IENPTkZJR19WSE9TVF9ORVQvVlNPQ0svU0NTSS4KPj4+Pgo+Pj4+IG9yCj4+Pj4KPj4+PiAy
KSBkb24ndCB1c2UgbWVudWNvbmZpZyBmb3IgQ09ORklHX1ZIT1NULCBsZXQgTkVUL1NDU0kvVkRQ
QSBqdXN0IHNlbGVjdCBpdC4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gT0sgSSB0cmllZCB0aGlzOgo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0
L0tjb25maWcKPj4+IGluZGV4IDI1MjNhMWQ0MjkwYS4uYTMxNGI5MDBkNDc5IDEwMDY0NAo+Pj4g
LS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnCj4+PiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25m
aWcKPj4+IEBAIC0xOSwxMSArMTksMTAgQEAgbWVudWNvbmZpZyBWSE9TVAo+Pj4gICAJICBUaGlz
IG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+
Pj4gICAJICB0aGUgY29yZSBvZiB2aG9zdC4KPj4+IC1pZiBWSE9TVAo+Pj4gLQo+Pj4gICBjb25m
aWcgVkhPU1RfTkVUCj4+PiAgIAl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9y
IHZpcnRpbyBuZXQiCj4+PiAgIAlkZXBlbmRzIG9uIE5FVCAmJiBFVkVOVEZEICYmIChUVU4gfHwg
IVRVTikgJiYgKFRBUCB8fCAhVEFQKQo+Pj4gKwlzZWxlY3QgVkhPU1QKPj4+ICAgCS0tLWhlbHAt
LS0KPj4+ICAgCSAgVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gaG9zdCBrZXJu
ZWwgdG8gYWNjZWxlcmF0ZQo+Pj4gICAJICBndWVzdCBuZXR3b3JraW5nIHdpdGggdmlydGlvX25l
dC4gTm90IHRvIGJlIGNvbmZ1c2VkIHdpdGggdmlydGlvX25ldAo+Pj4gQEAgLTM1LDYgKzM0LDcg
QEAgY29uZmlnIFZIT1NUX05FVAo+Pj4gICBjb25maWcgVkhPU1RfU0NTSQo+Pj4gICAJdHJpc3Rh
dGUgIlZIT1NUX1NDU0kgVENNIGZhYnJpYyBkcml2ZXIiCj4+PiAgIAlkZXBlbmRzIG9uIFRBUkdF
VF9DT1JFICYmIEVWRU5URkQKPj4+ICsJc2VsZWN0IFZIT1NUCj4+PiAgIAlkZWZhdWx0IG4KPj4+
ICAgCS0tLWhlbHAtLS0KPj4+ICAgCVNheSBNIGhlcmUgdG8gZW5hYmxlIHRoZSB2aG9zdF9zY3Np
IFRDTSBmYWJyaWMgbW9kdWxlCj4+PiBAQCAtNDQsNiArNDQsNyBAQCBjb25maWcgVkhPU1RfVlNP
Q0sKPj4+ICAgCXRyaXN0YXRlICJ2aG9zdCB2aXJ0aW8tdnNvY2sgZHJpdmVyIgo+Pj4gICAJZGVw
ZW5kcyBvbiBWU09DS0VUUyAmJiBFVkVOVEZECj4+PiAgIAlzZWxlY3QgVklSVElPX1ZTT0NLRVRT
X0NPTU1PTgo+Pj4gKwlzZWxlY3QgVkhPU1QKPj4+ICAgCWRlZmF1bHQgbgo+Pj4gICAJLS0taGVs
cC0tLQo+Pj4gICAJVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gdGhlIGhvc3Qg
a2VybmVsIHRvIHByb3ZpZGUgQUZfVlNPQ0sKPj4+IEBAIC01Nyw2ICs1OCw3IEBAIGNvbmZpZyBW
SE9TVF9WRFBBCj4+PiAgIAl0cmlzdGF0ZSAiVmhvc3QgZHJpdmVyIGZvciB2RFBBLWJhc2VkIGJh
Y2tlbmQiCj4+PiAgIAlkZXBlbmRzIG9uIEVWRU5URkQKPj4+ICAgCXNlbGVjdCBWRFBBCj4+PiAr
CXNlbGVjdCBWSE9TVAo+Pj4gICAJaGVscAo+Pj4gICAJICBUaGlzIGtlcm5lbCBtb2R1bGUgY2Fu
IGJlIGxvYWRlZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVyYXRlCj4+PiAgIAkgIGd1ZXN0IHZp
cnRpbyBkZXZpY2VzIHdpdGggdGhlIHZEUEEtYmFzZWQgYmFja2VuZHMuCj4+PiBAQCAtNzgsNSAr
ODAsMyBAQCBjb25maWcgVkhPU1RfQ1JPU1NfRU5ESUFOX0xFR0FDWQo+Pj4gICAJICBhZGRzIHNv
bWUgb3ZlcmhlYWQsIGl0IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuCj4+PiAgIAkgIElmIHVuc3Vy
ZSwgc2F5ICJOIi4KPj4+IC0KPj4+IC1lbmRpZgo+Pj4KPj4+Cj4+PiBCdXQgbm93IENPTkZJR19W
SE9TVCBpcyBhbHdheXMgInkiLCBuZXZlciAibSIuCj4+PiBXaGljaCBJIHRoaW5rIHdpbGwgbWFr
ZSBpdCBhIGJ1aWx0LWluLgo+Pj4gRGlkbid0IGZpZ3VyZSBvdXQgd2h5IHlldC4KPj4KPj4KPj4g
SXMgaXQgYmVjYXVzZSB0aGUgZGVwZW5kZW5jeSBvZiBFVkVOVEZEIGZvciBDT05GSUdfVkhPU1Q/
Cj4gCj4gT2ggbm8sIGl0J3MgYmVjYXVzZSBJIGZvcmdvdCB0byBjaGFuZ2UgbWVudWNvbmZpZyB0
byBjb25maWcuCj4gCj4gCj4+IFJlbW92ZSB0aGF0IG9uZSBmb3IgdGhpcyBwYXRjaCwgSSBjYW4g
Z2V0IENPTkZJR19WSE9TVD1tLgoKRldJVywgdGhlIGN1cnJlbnQgdmhvc3QvbGludXgtbmV4dCBi
cmFuY2ggc2VlbXMgdG8gd29yayBhZ2Fpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
