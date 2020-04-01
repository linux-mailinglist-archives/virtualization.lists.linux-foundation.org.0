Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFA19AD87
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:14:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76E1786E55;
	Wed,  1 Apr 2020 14:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4QWHEFjyC-d; Wed,  1 Apr 2020 14:14:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BFEFF86614;
	Wed,  1 Apr 2020 14:14:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1DBDC1AE2;
	Wed,  1 Apr 2020 14:14:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23083C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 11B5281D7D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sigDykSYyNem
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:14:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1BDC98653D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585750438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SgMHqO/rrpPCHGR8xK4BkGOVi78dVLWaqsGqMgXXbEE=;
 b=hKNDg57VY/EoINZtdh+NdUTkaffFR6FqhOLj+VLZn1AKe3hd2Q0S+5ruvSno0Z1RtXCqt5
 CTimV34echCNTkZrbFCXUE/F3qIBo22h4EjC0Ol2IoljSV4YOaam3N3yhYCHw/qQGmuhFl
 l17vcxr6f6njTiXEO+J2b17Acae4m3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-m5LNliciMgegU4oo4HtSiA-1; Wed, 01 Apr 2020 10:13:57 -0400
X-MC-Unique: m5LNliciMgegU4oo4HtSiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA86F107ACC7;
 Wed,  1 Apr 2020 14:13:53 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB4719C70;
 Wed,  1 Apr 2020 14:13:30 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: Christian Borntraeger <borntraeger@de.ibm.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
Date: Wed, 1 Apr 2020 22:13:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8xIOS4i+WNiDk6MDIsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPgo+
IE9uIDAxLjA0LjIwIDE0OjU2LCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4+IE9uIDAx
LjA0LjIwIDE0OjUwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4gT24gMjAyMC80LzEg5LiL5Y2INzoy
MSwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+Pj4+IE9uIDI2LjAzLjIwIDE1OjAxLCBK
YXNvbiBXYW5nIHdyb3RlOgo+Pj4+PiBDdXJyZW50bHksIENPTkZJR19WSE9TVCBkZXBlbmRzIG9u
IENPTkZJR19WSVJUVUFMSVpBVElPTi4gQnV0IHZob3N0IGlzCj4+Pj4+IG5vdCBuZWNlc3Nhcmls
eSBmb3IgVk0gc2luY2UgaXQncyBhIGdlbmVyaWMgdXNlcnNwYWNlIGFuZCBrZXJuZWwKPj4+Pj4g
Y29tbXVuaWNhdGlvbiBwcm90b2NvbC4gU3VjaCBkZXBlbmRlbmN5IG1heSBwcmV2ZW50IGFyY2hz
IHdpdGhvdXQKPj4+Pj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBmcm9tIHVzaW5nIHZob3N0Lgo+
Pj4+Pgo+Pj4+PiBUbyBzb2x2ZSB0aGlzLCBhIGRlZGljYXRlZCB2aG9zdCBtZW51IGlzIGNyZWF0
ZWQgdW5kZXIgZHJpdmVycyBzbwo+Pj4+PiBDT05JRkdfVkhPU1QgY2FuIGJlIGRlY291cGxlZCBv
dXQgb2YgQ09ORklHX1ZJUlRVQUxJWkFUSU9OLgo+Pj4+IEZXSVcsIHRoaXMgbm93IHJlc3VsdHMg
aW4gdmhvc3Qgbm90IGJlaW5nIGJ1aWxkIHdpdGggZGVmY29uZmlnIGtlcm5lbHMgKGluIHRvZGF5
cwo+Pj4+IGxpbnV4LW5leHQpLgo+Pj4+Cj4+PiBIaSBDaHJpc3RpYW46Cj4+Pgo+Pj4gRGlkIHlv
dSBtZWV0IGl0IGV2ZW4gd2l0aCB0aGlzIGNvbW1pdMKgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2lkPWE0
YmU0MGNiY2VkYmE5YjViNzE0ZjNjOTUxODJlOGE0NTE3NmU0MmQ/Cj4+IEkgc2ltcGx5IHVzZWQg
bGludXgtbmV4dC4gVGhlIGRlZmNvbmZpZyBkb2VzIE5PVCBjb250YWluIENPTkZJR19WSE9TVCBh
bmQgdGhlcmVmb3JlIENPTkZJR19WSE9TVF9ORVQgYW5kIGZyaWVuZHMKPj4gY2FuIG5vdCBiZSBz
ZWxlY3RlZC4KPj4KPj4gJCBnaXQgY2hlY2tvdXQgbmV4dC0yMDIwMDQwMQo+PiAkIG1ha2UgZGVm
Y29uZmlnCj4+ICAgIEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9maXhkZXAKPj4gICAgSE9TVENDICBz
Y3JpcHRzL2tjb25maWcvY29uZi5vCj4+ICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2NvbmZk
YXRhLm8KPj4gICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvZXhwci5vCj4+ICAgIExFWCAgICAg
c2NyaXB0cy9rY29uZmlnL2xleGVyLmxleC5jCj4+ICAgIFlBQ0MgICAgc2NyaXB0cy9rY29uZmln
L3BhcnNlci50YWIuW2NoXQo+PiAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9sZXhlci5sZXgu
bwo+PiAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wYXJzZXIudGFiLm8KPj4gICAgSE9TVEND
ICBzY3JpcHRzL2tjb25maWcvcHJlcHJvY2Vzcy5vCj4+ICAgIEhPU1RDQyAgc2NyaXB0cy9rY29u
ZmlnL3N5bWJvbC5vCj4+ICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL3V0aWwubwo+PiAgICBI
T1NUTEQgIHNjcmlwdHMva2NvbmZpZy9jb25mCj4+ICoqKiBEZWZhdWx0IGNvbmZpZ3VyYXRpb24g
aXMgYmFzZWQgb24gJ3g4Nl82NF9kZWZjb25maWcnCj4+ICMKPj4gIyBjb25maWd1cmF0aW9uIHdy
aXR0ZW4gdG8gLmNvbmZpZwo+PiAjCj4+Cj4+ICQgZ3JlcCBWSE9TVCAuY29uZmlnCj4+ICMgQ09O
RklHX1ZIT1NUIGlzIG5vdCBzZXQKPj4KPj4gICAKPj4+IElmIHllcywgd2hhdCdzIHlvdXIgYnVp
bGQgY29uZmlnIGxvb2tzIGxpa2U/Cj4+Pgo+Pj4gVGhhbmtzCj4gVGhpcyB3YXMgeDg2LiBOb3Qg
c3VyZSBpZiB0aGF0IGRpZCB3b3JrIGJlZm9yZS4KPiBPbiBzMzkwIHRoaXMgaXMgZGVmaW5pdGVs
eSBhIHJlZ3Jlc3Npb24gYXMgdGhlIGRlZmNvbmZpZyBmaWxlcwo+IGZvciBzMzkwIGRvIHNlbGVj
dCBWSE9TVF9ORVQKPgo+IGdyZXAgVkhPU1QgYXJjaC9zMzkwL2NvbmZpZ3MvKgo+IGFyY2gvczM5
MC9jb25maWdzL2RlYnVnX2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfTkVUPW0KPiBhcmNoL3MzOTAv
Y29uZmlncy9kZWJ1Z19kZWZjb25maWc6Q09ORklHX1ZIT1NUX1ZTT0NLPW0KPiBhcmNoL3MzOTAv
Y29uZmlncy9kZWZjb25maWc6Q09ORklHX1ZIT1NUX05FVD1tCj4gYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVmY29uZmlnOkNPTkZJR19WSE9TVF9WU09DSz1tCj4KPiBhbmQgdGhpcyB3b3JrZWQgd2l0aCA1
LjYsIGJ1dCBkb2VzIG5vdCB3b3JrIHdpdGggbmV4dC4gSnVzdCBhZGRpbmcKPiBDT05GSUdfVkhP
U1Q9bSB0byB0aGUgZGVmY29uZmlnIHNvbHZlcyB0aGUgaXNzdWUsIHNvbWV0aGluZyBsaWtlCgoK
UmlnaHQsIEkgdGhpbmsgd2UgcHJvYmFibHkgbmVlZAoKMSkgYWRkIENPTkZJR19WSE9TVD1tIHRv
IGFsbCBkZWZjb25maWdzIHRoYXQgZW5hYmxlcyAKQ09ORklHX1ZIT1NUX05FVC9WU09DSy9TQ1NJ
LgoKb3IKCjIpIGRvbid0IHVzZSBtZW51Y29uZmlnIGZvciBDT05GSUdfVkhPU1QsIGxldCBORVQv
U0NTSS9WRFBBIGp1c3Qgc2VsZWN0IGl0LgoKVGhhbmtzCgoKPgo+IC0tLQo+ICAgYXJjaC9zMzkw
L2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnIHwgNSArKystLQo+ICAgYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVmY29uZmlnICAgICAgIHwgNSArKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVidWdfZGVmY29uZmlnIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnCj4gaW5k
ZXggNDYwMzhiYzU4YzllLi4wYjgzMjc0MzQxY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL2Nv
bmZpZ3MvZGVidWdfZGVmY29uZmlnCj4gKysrIGIvYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVm
Y29uZmlnCj4gQEAgLTU3LDggKzU3LDYgQEAgQ09ORklHX1BST1RFQ1RFRF9WSVJUVUFMSVpBVElP
Tl9HVUVTVD15Cj4gICBDT05GSUdfQ01NPW0KPiAgIENPTkZJR19BUFBMREFUQV9CQVNFPXkKPiAg
IENPTkZJR19LVk09bQo+IC1DT05GSUdfVkhPU1RfTkVUPW0KPiAtQ09ORklHX1ZIT1NUX1ZTT0NL
PW0KPiAgIENPTkZJR19PUFJPRklMRT1tCj4gICBDT05GSUdfS1BST0JFUz15Cj4gICBDT05GSUdf
SlVNUF9MQUJFTD15Cj4gQEAgLTU2MSw2ICs1NTksOSBAQCBDT05GSUdfVkZJT19NREVWX0RFVklD
RT1tCj4gICBDT05GSUdfVklSVElPX1BDST1tCj4gICBDT05GSUdfVklSVElPX0JBTExPT049bQo+
ICAgQ09ORklHX1ZJUlRJT19JTlBVVD15Cj4gK0NPTkZJR19WSE9TVD1tCj4gK0NPTkZJR19WSE9T
VF9ORVQ9bQo+ICtDT05GSUdfVkhPU1RfVlNPQ0s9bQo+ICAgQ09ORklHX1MzOTBfQ0NXX0lPTU1V
PXkKPiAgIENPTkZJR19TMzkwX0FQX0lPTU1VPXkKPiAgIENPTkZJR19FWFQ0X0ZTPXkKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVmY29uZmlnCj4gaW5kZXggN2NkMDY0OGMxZjRlLi4zOWU2OWM0ZThjZjcgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnCj4gKysrIGIvYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVmY29uZmlnCj4gQEAgLTU3LDggKzU3LDYgQEAgQ09ORklHX1BST1RFQ1RFRF9WSVJUVUFMSVpB
VElPTl9HVUVTVD15Cj4gICBDT05GSUdfQ01NPW0KPiAgIENPTkZJR19BUFBMREFUQV9CQVNFPXkK
PiAgIENPTkZJR19LVk09bQo+IC1DT05GSUdfVkhPU1RfTkVUPW0KPiAtQ09ORklHX1ZIT1NUX1ZT
T0NLPW0KPiAgIENPTkZJR19PUFJPRklMRT1tCj4gICBDT05GSUdfS1BST0JFUz15Cj4gICBDT05G
SUdfSlVNUF9MQUJFTD15Cj4gQEAgLTU1Nyw2ICs1NTUsOSBAQCBDT05GSUdfVkZJT19NREVWX0RF
VklDRT1tCj4gICBDT05GSUdfVklSVElPX1BDST1tCj4gICBDT05GSUdfVklSVElPX0JBTExPT049
bQo+ICAgQ09ORklHX1ZJUlRJT19JTlBVVD15Cj4gK0NPTkZJR19WSE9TVD1tCj4gK0NPTkZJR19W
SE9TVF9ORVQ9bQo+ICtDT05GSUdfVkhPU1RfVlNPQ0s9bQo+ICAgQ09ORklHX1MzOTBfQ0NXX0lP
TU1VPXkKPiAgIENPTkZJR19TMzkwX0FQX0lPTU1VPXkKPiAgIENPTkZJR19FWFQ0X0ZTPXkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
