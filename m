Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332D19AD72
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:09:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 883D188546;
	Wed,  1 Apr 2020 14:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnQGYdwLa019; Wed,  1 Apr 2020 14:09:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3262884ED;
	Wed,  1 Apr 2020 14:09:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9075EC089F;
	Wed,  1 Apr 2020 14:09:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0106C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 89477863A6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqrp6Q-e-2Wp
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:09:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8B4BD8560F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585750173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kdHmlxvV7fNOjmpSHAm/KiztYrW2H3haVanmSw7PZY=;
 b=AIiG70T2m8mQ2HISa+2GftSUtM1vp3mrIumfSxH/4/NSDtK5NZoQQJRd3yi4iMf+2/0K4O
 BHM2xFuPfyWD2nJf4Q/mCIhvJEVNJj43oDs2M83VBrv3COD0WTheY2cK5k0r2vAABFRe7o
 HnqN049OvK8/laaxRJ4PxrFnBLgWc7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-uMleTj1rOEiSPPbbID0kuw-1; Wed, 01 Apr 2020 10:09:27 -0400
X-MC-Unique: uMleTj1rOEiSPPbbID0kuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF0C41922962;
 Wed,  1 Apr 2020 14:09:24 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DD7910002D0;
 Wed,  1 Apr 2020 14:09:00 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
Date: Wed, 1 Apr 2020 22:08:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401092004-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8xIOS4i+WNiDk6MjIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBU
aHUsIE1hciAyNiwgMjAyMCBhdCAxMDowMToxN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBDdXJyZW50bHksIENPTkZJR19WSE9TVCBkZXBlbmRzIG9uIENPTkZJR19WSVJUVUFMSVpBVElP
Ti4gQnV0IHZob3N0IGlzCj4+IG5vdCBuZWNlc3NhcmlseSBmb3IgVk0gc2luY2UgaXQncyBhIGdl
bmVyaWMgdXNlcnNwYWNlIGFuZCBrZXJuZWwKPj4gY29tbXVuaWNhdGlvbiBwcm90b2NvbC4gU3Vj
aCBkZXBlbmRlbmN5IG1heSBwcmV2ZW50IGFyY2hzIHdpdGhvdXQKPj4gdmlydHVhbGl6YXRpb24g
c3VwcG9ydCBmcm9tIHVzaW5nIHZob3N0Lgo+Pgo+PiBUbyBzb2x2ZSB0aGlzLCBhIGRlZGljYXRl
ZCB2aG9zdCBtZW51IGlzIGNyZWF0ZWQgdW5kZXIgZHJpdmVycyBzbwo+PiBDT05JRkdfVkhPU1Qg
Y2FuIGJlIGRlY291cGxlZCBvdXQgb2YgQ09ORklHX1ZJUlRVQUxJWkFUSU9OLgo+Pgo+PiBXaGls
ZSBhdCBpdCwgYWxzbyBzcXVhc2ggS2NvbmZpZy52cmluZ2ggaW50byB2aG9zdCBLY29uZmlnIGZp
bGUuIFRoaXMKPj4gYXZvaWRzIHRoZSB0cmljayBvZiBjb25kaXRpb25hbCBpbmNsdXNpb24gZnJv
bSBWT1Agb3IgQ0FJRi4gVGhlbiBpdAo+PiB3aWxsIGJlIGVhc2llciB0byBpbnRyb2R1Y2UgbmV3
IHZyaW5naCB1c2VycyBhbmQgY29tbW9uIGRlcGVuZGVuY3kgZm9yCj4+IGJvdGggdnJpbmdoIGFu
ZCB2aG9zdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4KPiBJcyB0aGlzIGp1c3Qgc28gd2UgY2FuIGRyb3AgdGhlIGRlcGVuZGVuY3kgb24gQ09O
RklHX1ZJUlRVQUxJWkFUSU9OPwo+IElmIHllcyB3aGF0IGhhcHBlbnMgaWYgd2UgZHJvcCB0aGlz
IHBhdGNoPwoKClRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlbiBWSE9TVF9SSU5HIG11c3QgZGVwZW5k
IG9uIENPTkZJR19WSVJUVUFMSVpBVElPTiAKKHdoaWNoIGVuYWJsZSBWSE9TVF9JT1RMQikgdG8g
d29yay4KCkJ1dCBpdCBsb29rcyB0byBtZSBDQUlGIGFuZCBWT1AgZG9lc24ndCByZXF1aXJlcyBD
T05GSUdfVklSVFVBTElaQVRJT04uCgoKPiBHaXZlbiB0aGUgaW1wYWN0IGl0IGhhZCBJJ2QgbGlr
ZSB0byBkZWZlciBpdCB0aWxsIG5leHQgcmVsZWFzZSBpZgo+IHBvc3NpYmxlLgo+Cj4KPj4gLS0t
Cj4+ICAgYXJjaC9hcm0va3ZtL0tjb25maWcgICAgICAgICB8ICAyIC0tCj4+ICAgYXJjaC9hcm02
NC9rdm0vS2NvbmZpZyAgICAgICB8ICAyIC0tCj4+ICAgYXJjaC9taXBzL2t2bS9LY29uZmlnICAg
ICAgICB8ICAyIC0tCj4+ICAgYXJjaC9wb3dlcnBjL2t2bS9LY29uZmlnICAgICB8ICAyIC0tCj4+
ICAgYXJjaC9zMzkwL2t2bS9LY29uZmlnICAgICAgICB8ICA0IC0tLS0KPj4gICBhcmNoL3g4Ni9r
dm0vS2NvbmZpZyAgICAgICAgIHwgIDQgLS0tLQo+PiAgIGRyaXZlcnMvS2NvbmZpZyAgICAgICAg
ICAgICAgfCAgMiArKwo+PiAgIGRyaXZlcnMvbWlzYy9taWMvS2NvbmZpZyAgICAgfCAgNCAtLS0t
Cj4+ICAgZHJpdmVycy9uZXQvY2FpZi9LY29uZmlnICAgICB8ICA0IC0tLS0KPj4gICBkcml2ZXJz
L3Zob3N0L0tjb25maWcgICAgICAgIHwgMjMgKysrKysrKysrKysrKystLS0tLS0tLS0KPj4gICBk
cml2ZXJzL3Zob3N0L0tjb25maWcudnJpbmdoIHwgIDYgLS0tLS0tCj4+ICAgMTEgZmlsZXMgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCj4+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvdmhvc3QvS2NvbmZpZy52cmluZ2gKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2t2bS9LY29uZmlnIGIvYXJjaC9hcm0va3ZtL0tjb25maWcKPj4gaW5kZXggZjU5MTAy
NjM0N2E1Li5iZTk3MzkzNzYxYmYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2t2bS9LY29uZmln
Cj4+ICsrKyBiL2FyY2gvYXJtL2t2bS9LY29uZmlnCj4+IEBAIC01NCw2ICs1NCw0IEBAIGNvbmZp
ZyBLVk1fQVJNX0hPU1QKPj4gICAJLS0taGVscC0tLQo+PiAgIAkgIFByb3ZpZGVzIGhvc3Qgc3Vw
cG9ydCBmb3IgQVJNIHByb2Nlc3NvcnMuCj4+ICAgCj4+IC1zb3VyY2UgImRyaXZlcnMvdmhvc3Qv
S2NvbmZpZyIKPj4gLQo+PiAgIGVuZGlmICMgVklSVFVBTElaQVRJT04KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQva3ZtL0tjb25maWcgYi9hcmNoL2FybTY0L2t2bS9LY29uZmlnCj4+IGluZGV4
IGE0NzVjNjhjYmZlYy4uNDQ5Mzg2ZDc2NDQxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2t2
bS9LY29uZmlnCj4+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL0tjb25maWcKPj4gQEAgLTY0LDYgKzY0
LDQgQEAgY29uZmlnIEtWTV9BUk1fUE1VCj4+ICAgY29uZmlnIEtWTV9JTkRJUkVDVF9WRUNUT1JT
Cj4+ICAgICAgICAgIGRlZl9ib29sIEtWTSAmJiAoSEFSREVOX0JSQU5DSF9QUkVESUNUT1IgfHwg
SEFSREVOX0VMMl9WRUNUT1JTKQo+PiAgIAo+PiAtc291cmNlICJkcml2ZXJzL3Zob3N0L0tjb25m
aWciCj4+IC0KPj4gICBlbmRpZiAjIFZJUlRVQUxJWkFUSU9OCj4+IGRpZmYgLS1naXQgYS9hcmNo
L21pcHMva3ZtL0tjb25maWcgYi9hcmNoL21pcHMva3ZtL0tjb25maWcKPj4gaW5kZXggZWFjMjVh
ZWYyMWUwLi5iOTFkMTQ1YWEyZDUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvbWlwcy9rdm0vS2NvbmZp
Zwo+PiArKysgYi9hcmNoL21pcHMva3ZtL0tjb25maWcKPj4gQEAgLTcyLDYgKzcyLDQgQEAgY29u
ZmlnIEtWTV9NSVBTX0RFQlVHX0NPUDBfQ09VTlRFUlMKPj4gICAKPj4gICAJICBJZiB1bnN1cmUs
IHNheSBOLgo+PiAgIAo+PiAtc291cmNlICJkcml2ZXJzL3Zob3N0L0tjb25maWciCj4+IC0KPj4g
ICBlbmRpZiAjIFZJUlRVQUxJWkFUSU9OCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva3Zt
L0tjb25maWcgYi9hcmNoL3Bvd2VycGMva3ZtL0tjb25maWcKPj4gaW5kZXggNzExZmNhOWJjNmYw
Li4xMjg4NWVkYTMyNGUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vS2NvbmZpZwo+
PiArKysgYi9hcmNoL3Bvd2VycGMva3ZtL0tjb25maWcKPj4gQEAgLTIwNCw2ICsyMDQsNCBAQCBj
b25maWcgS1ZNX1hJVkUKPj4gICAJZGVmYXVsdCB5Cj4+ICAgCWRlcGVuZHMgb24gS1ZNX1hJQ1Mg
JiYgUFBDX1hJVkVfTkFUSVZFICYmIEtWTV9CT09LM1NfSFZfUE9TU0lCTEUKPj4gICAKPj4gLXNv
dXJjZSAiZHJpdmVycy92aG9zdC9LY29uZmlnIgo+PiAtCj4+ICAgZW5kaWYgIyBWSVJUVUFMSVpB
VElPTgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2t2bS9LY29uZmlnIGIvYXJjaC9zMzkwL2t2
bS9LY29uZmlnCj4+IGluZGV4IGQzZGIzZDdlZDA3Ny4uZGVmM2I2MGYxZmU4IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3MzOTAva3ZtL0tjb25maWcKPj4gKysrIGIvYXJjaC9zMzkwL2t2bS9LY29uZmln
Cj4+IEBAIC01NSw4ICs1NSw0IEBAIGNvbmZpZyBLVk1fUzM5MF9VQ09OVFJPTAo+PiAgIAo+PiAg
IAkgIElmIHVuc3VyZSwgc2F5IE4uCj4+ICAgCj4+IC0jIE9LLCBpdCdzIGEgbGl0dGxlIGNvdW50
ZXItaW50dWl0aXZlIHRvIGRvIHRoaXMsIGJ1dCBpdCBwdXRzIGl0IG5lYXRseSB1bmRlcgo+PiAt
IyB0aGUgdmlydHVhbGl6YXRpb24gbWVudS4KPj4gLXNvdXJjZSAiZHJpdmVycy92aG9zdC9LY29u
ZmlnIgo+PiAtCj4+ICAgZW5kaWYgIyBWSVJUVUFMSVpBVElPTgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL0tjb25maWcgYi9hcmNoL3g4Ni9rdm0vS2NvbmZpZwo+PiBpbmRleCA5OTEwMTlk
NWVlZTEuLjBkZmU3MGUxN2FmOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYva3ZtL0tjb25maWcK
Pj4gKysrIGIvYXJjaC94ODYva3ZtL0tjb25maWcKPj4gQEAgLTk0LDggKzk0LDQgQEAgY29uZmln
IEtWTV9NTVVfQVVESVQKPj4gICAJIFRoaXMgb3B0aW9uIGFkZHMgYSBSL1cga1ZNIG1vZHVsZSBw
YXJhbWV0ZXIgJ21tdV9hdWRpdCcsIHdoaWNoIGFsbG93cwo+PiAgIAkgYXVkaXRpbmcgb2YgS1ZN
IE1NVSBldmVudHMgYXQgcnVudGltZS4KPj4gICAKPj4gLSMgT0ssIGl0J3MgYSBsaXR0bGUgY291
bnRlci1pbnR1aXRpdmUgdG8gZG8gdGhpcywgYnV0IGl0IHB1dHMgaXQgbmVhdGx5IHVuZGVyCj4+
IC0jIHRoZSB2aXJ0dWFsaXphdGlvbiBtZW51Lgo+PiAtc291cmNlICJkcml2ZXJzL3Zob3N0L0tj
b25maWciCj4+IC0KPj4gICBlbmRpZiAjIFZJUlRVQUxJWkFUSU9OCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL0tjb25maWcgYi9kcml2ZXJzL0tjb25maWcKPj4gaW5kZXggOGJlZmE1M2Y0M2JlLi43
YTZkOGIyYjY4YjQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvS2NvbmZpZwo+PiArKysgYi9kcml2
ZXJzL0tjb25maWcKPj4gQEAgLTEzOCw2ICsxMzgsOCBAQCBzb3VyY2UgImRyaXZlcnMvdmlydC9L
Y29uZmlnIgo+PiAgIAo+PiAgIHNvdXJjZSAiZHJpdmVycy92aXJ0aW8vS2NvbmZpZyIKPj4gICAK
Pj4gK3NvdXJjZSAiZHJpdmVycy92aG9zdC9LY29uZmlnIgo+PiArCj4+ICAgc291cmNlICJkcml2
ZXJzL2h2L0tjb25maWciCj4+ICAgCj4+ICAgc291cmNlICJkcml2ZXJzL3hlbi9LY29uZmlnIgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21pYy9LY29uZmlnIGIvZHJpdmVycy9taXNjL21p
Yy9LY29uZmlnCj4+IGluZGV4IGI2ODQxYmE2ZDkyMi4uOGYyMDFkMDE5ZjVhIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL21pc2MvbWljL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9taXNjL21pYy9L
Y29uZmlnCj4+IEBAIC0xMzMsOCArMTMzLDQgQEAgY29uZmlnIFZPUAo+PiAgIAkgIE9TIGFuZCB0
b29scyBmb3IgTUlDIHRvIHVzZSB3aXRoIHRoaXMgZHJpdmVyIGFyZSBhdmFpbGFibGUgZnJvbQo+
PiAgIAkgIDxodHRwOi8vc29mdHdhcmUuaW50ZWwuY29tL2VuLXVzL21pYy1kZXZlbG9wZXI+Lgo+
PiAgIAo+PiAtaWYgVk9QCj4+IC1zb3VyY2UgImRyaXZlcnMvdmhvc3QvS2NvbmZpZy52cmluZ2gi
Cj4+IC1lbmRpZgo+PiAtCj4+ICAgZW5kbWVudQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
Y2FpZi9LY29uZmlnIGIvZHJpdmVycy9uZXQvY2FpZi9LY29uZmlnCj4+IGluZGV4IGU3NGUyYmI2
MTIzNi4uOWRiMDU3MGM1YmViIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9jYWlmL0tjb25m
aWcKPj4gKysrIGIvZHJpdmVycy9uZXQvY2FpZi9LY29uZmlnCj4+IEBAIC01OCw4ICs1OCw0IEBA
IGNvbmZpZyBDQUlGX1ZJUlRJTwo+PiAgIAktLS1oZWxwLS0tCj4+ICAgCSAgVGhlIENBSUYgZHJp
dmVyIGZvciBDQUlGIG92ZXIgVmlydGlvLgo+PiAgIAo+PiAtaWYgQ0FJRl9WSVJUSU8KPj4gLXNv
dXJjZSAiZHJpdmVycy92aG9zdC9LY29uZmlnLnZyaW5naCIKPj4gLWVuZGlmCj4+IC0KPj4gICBl
bmRpZiAjIENBSUZfRFJJVkVSUwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9LY29uZmln
IGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4+IGluZGV4IDNkMDNjY2JkMWFkYy4uNGFlZjEwYTU0
Y2QxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPj4gKysrIGIvZHJpdmVy
cy92aG9zdC9LY29uZmlnCj4+IEBAIC0xLDggKzEsMjAgQEAKPj4gICAjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPj4gK2NvbmZpZyBWSE9TVF9SSU5HCj4+ICsJdHJpc3Rh
dGUKPj4gKwloZWxwCj4+ICsJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVy
IHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+PiArCSAgdGhlIGhvc3Qgc2lkZSBvZiBhIHZpcnRpbyBy
aW5nLgo+PiArCj4+ICttZW51Y29uZmlnIFZIT1NUCj4+ICsJdHJpc3RhdGUgIkhvc3Qga2VybmVs
IGFjY2VsZXJhdG9yIGZvciB2aXJ0aW8gKFZIT1NUKSIKPj4gKwloZWxwCj4+ICsJICBUaGlzIG9w
dGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+PiAr
CSAgdGhlIGNvcmUgb2Ygdmhvc3QuCj4+ICtpZiBWSE9TVAo+PiArCj4gVGhlIGRlc2NyaXB0aW9u
IGhlcmUgaXMgd3JvbmcsIGlzbid0IGl0Pwo+IFZIT1NUIGFuZCBWSE9TVF9SSU5HIGFyZSBubyBs
b25nZXIgc2VsZWN0ZWQsIHJpZ2h0PwoKCkZvciBWSE9TVCBub3QgY3VycmVudGx5LgoKRm9yIFZI
T1NUX1JJTkcsIGl0IHdhcyBzZWxlY3RlZCBieSBDQUlGLCBWT1AgYW5kIFZEUEFTSU0uCgpUaGFu
a3MKCgo+Cj4KPj4gICBjb25maWcgVkhPU1RfTkVUCj4+ICAgCXRyaXN0YXRlICJIb3N0IGtlcm5l
bCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIG5ldCIKPj4gICAJZGVwZW5kcyBvbiBORVQgJiYgRVZF
TlRGRCAmJiAoVFVOIHx8ICFUVU4pICYmIChUQVAgfHwgIVRBUCkKPj4gLQlzZWxlY3QgVkhPU1QK
Pj4gICAJLS0taGVscC0tLQo+PiAgIAkgIFRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVk
IGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKPj4gICAJICBndWVzdCBuZXR3b3JraW5nIHdp
dGggdmlydGlvX25ldC4gTm90IHRvIGJlIGNvbmZ1c2VkIHdpdGggdmlydGlvX25ldAo+PiBAQCAt
MTQsNyArMjYsNiBAQCBjb25maWcgVkhPU1RfTkVUCj4+ICAgY29uZmlnIFZIT1NUX1NDU0kKPj4g
ICAJdHJpc3RhdGUgIlZIT1NUX1NDU0kgVENNIGZhYnJpYyBkcml2ZXIiCj4+ICAgCWRlcGVuZHMg
b24gVEFSR0VUX0NPUkUgJiYgRVZFTlRGRAo+PiAtCXNlbGVjdCBWSE9TVAo+PiAgIAlkZWZhdWx0
IG4KPj4gICAJLS0taGVscC0tLQo+PiAgIAlTYXkgTSBoZXJlIHRvIGVuYWJsZSB0aGUgdmhvc3Rf
c2NzaSBUQ00gZmFicmljIG1vZHVsZQo+PiBAQCAtMjQsNyArMzUsNiBAQCBjb25maWcgVkhPU1Rf
VlNPQ0sKPj4gICAJdHJpc3RhdGUgInZob3N0IHZpcnRpby12c29jayBkcml2ZXIiCj4+ICAgCWRl
cGVuZHMgb24gVlNPQ0tFVFMgJiYgRVZFTlRGRAo+PiAgIAlzZWxlY3QgVklSVElPX1ZTT0NLRVRT
X0NPTU1PTgo+PiAtCXNlbGVjdCBWSE9TVAo+PiAgIAlkZWZhdWx0IG4KPj4gICAJLS0taGVscC0t
LQo+PiAgIAlUaGlzIGtlcm5lbCBtb2R1bGUgY2FuIGJlIGxvYWRlZCBpbiB0aGUgaG9zdCBrZXJu
ZWwgdG8gcHJvdmlkZSBBRl9WU09DSwo+PiBAQCAtMzQsMTIgKzQ0LDYgQEAgY29uZmlnIFZIT1NU
X1ZTT0NLCj4+ICAgCVRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBN
IGhlcmU6IHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQKPj4gICAJdmhvc3RfdnNvY2suCj4+ICAg
Cj4+IC1jb25maWcgVkhPU1QKPj4gLQl0cmlzdGF0ZQo+PiAtCS0tLWhlbHAtLS0KPj4gLQkgIFRo
aXMgb3B0aW9uIGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNz
Cj4+IC0JICB0aGUgY29yZSBvZiB2aG9zdC4KPj4gLQo+PiAgIGNvbmZpZyBWSE9TVF9DUk9TU19F
TkRJQU5fTEVHQUNZCj4+ICAgCWJvb2wgIkNyb3NzLWVuZGlhbiBzdXBwb3J0IGZvciB2aG9zdCIK
Pj4gICAJZGVmYXVsdCBuCj4+IEBAIC01NCwzICs1OCw0IEBAIGNvbmZpZyBWSE9TVF9DUk9TU19F
TkRJQU5fTEVHQUNZCj4+ICAgCSAgYWRkcyBzb21lIG92ZXJoZWFkLCBpdCBpcyBkaXNhYmxlZCBi
eSBkZWZhdWx0Lgo+PiAgIAo+PiAgIAkgIElmIHVuc3VyZSwgc2F5ICJOIi4KPj4gK2VuZGlmCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcudnJpbmdoIGIvZHJpdmVycy92aG9z
dC9LY29uZmlnLnZyaW5naAo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggYzFm
ZTM2YTliOGQ0Li4wMDAwMDAwMDAwMDAKPj4gLS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnLnZy
aW5naAo+PiArKysgL2Rldi9udWxsCj4+IEBAIC0xLDYgKzAsMCBAQAo+PiAtIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4+IC1jb25maWcgVkhPU1RfUklORwo+PiAtCXRy
aXN0YXRlCj4+IC0JLS0taGVscC0tLQo+PiAtCSAgVGhpcyBvcHRpb24gaXMgc2VsZWN0ZWQgYnkg
YW55IGRyaXZlciB3aGljaCBuZWVkcyB0byBhY2Nlc3MKPj4gLQkgIHRoZSBob3N0IHNpZGUgb2Yg
YSB2aXJ0aW8gcmluZy4KPj4gLS0gCj4+IDIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
