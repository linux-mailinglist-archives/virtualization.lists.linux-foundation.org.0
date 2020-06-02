Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B21EB95F
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 12:17:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EDEE58774F;
	Tue,  2 Jun 2020 10:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVrzgzuQQDZA; Tue,  2 Jun 2020 10:17:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA09187750;
	Tue,  2 Jun 2020 10:17:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B55D9C016E;
	Tue,  2 Jun 2020 10:17:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C461FC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 10:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1D9320028
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 10:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85PN7D0H2I7Q
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 10:17:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 2447B20023
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591093058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8flul9T5/INbLuHOQ1wE5MsczYdkAsRCFisLMaoyM8=;
 b=Qql/2PTec1H/zosc6LOdUw0sJ/L1Ot5sjcaRkRZ4LUVH45MabF0YsVY9ltqDmuI1zhTGVO
 RxyZGHyHgL04Otq0AzEhi+SyJXZ4XzbB63mz16BE6SWnLigSFZlCvu7taj/XH4XP5/GLgi
 ooZCKFbEXSAaTHqBE+CZOCKiIhEqV4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-_gVI1e6lPeGjgn2AI4D0lw-1; Tue, 02 Jun 2020 06:17:07 -0400
X-MC-Unique: _gVI1e6lPeGjgn2AI4D0lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC751030982;
 Tue,  2 Jun 2020 10:17:05 +0000 (UTC)
Received: from [10.72.12.83] (ovpn-12-83.pek2.redhat.com [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9C8100164D;
 Tue,  2 Jun 2020 10:16:54 +0000 (UTC)
Subject: Re: [PATCH] vdpa: bypass waking up vhost_woker for vdpa vq kick
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
 Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20200602094203.GU30374@kadam>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b8ccbccf-f667-8d15-8de2-b87da5f51ec3@redhat.com>
Date: Tue, 2 Jun 2020 18:16:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602094203.GU30374@kadam>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kbuild-all@lists.01.org, lkp@intel.com, lulu@redhat.com
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDU6NDIsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gSGkgWmh1LAo+
Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL1podS1M
aW5nc2hhbi92ZHBhLWJ5cGFzcy13YWtpbmctdXAtdmhvc3Rfd29rZXItZm9yLXZkcGEtdnEta2lj
ay8yMDIwMDUyNi0xMzM4MTkKPiBiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQgbGludXgtbmV4dAo+IGNvbmZpZzogeDg2
XzY0LXJhbmRjb25maWctbTAwMS0yMDIwMDUyOSAoYXR0YWNoZWQgYXMgLmNvbmZpZykKPiBjb21w
aWxlcjogZ2NjLTkgKERlYmlhbiA5LjMuMC0xMykgOS4zLjAKPgo+IElmIHlvdSBmaXggdGhlIGlz
c3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgYXMgYXBwcm9wcmlhdGUKPiBSZXBvcnRlZC1i
eToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPgo+IHNtYXRjaCB3YXJuaW5nczoK
PiBkcml2ZXJzL3Zob3N0L3ZkcGEuYzozNDggdmhvc3RfdmRwYV9zZXRfdnJpbmdfa2ljaygpIGVy
cm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAncicuCj4KPiAjIGh0dHBzOi8vZ2l0aHViLmNvbS8w
ZGF5LWNpL2xpbnV4L2NvbW1pdC9hODRkZGJmMWVmMjlmMThhYWZiMmJiOGE5M2JjZWRkNGEyOWE5
NjdkCj4gZ2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3IGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5
LWNpL2xpbnV4Cj4gZ2l0IHJlbW90ZSB1cGRhdGUgbGludXgtcmV2aWV3Cj4gZ2l0IGNoZWNrb3V0
IGE4NGRkYmYxZWYyOWYxOGFhZmIyYmI4YTkzYmNlZGQ0YTI5YTk2N2QKPiB2aW0gKy9yICszNDgg
ZHJpdmVycy92aG9zdC92ZHBhLmMKPgo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIw
LTA1LTI2ICAzMTYgIHN0YXRpYyBsb25nIHZob3N0X3ZkcGFfc2V0X3ZyaW5nX2tpY2soc3RydWN0
IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAt
MDUtMjYgIDMxNyAgCQkJCSAgICAgIHZvaWQgX191c2VyICphcmdwKQo+IGE4NGRkYmYxZWYyOWYx
IFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2ICAzMTggIHsKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGlu
Z3NoYW4gMjAyMC0wNS0yNiAgMzE5ICAJYm9vbCBwb2xsc3RhcnQgPSBmYWxzZSwgcG9sbHN0b3Ag
PSBmYWxzZTsKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAgMzIwICAJ
c3RydWN0IGZpbGUgKmV2ZW50ZnAsICpmaWxlcCA9IE5VTEw7Cj4gYTg0ZGRiZjFlZjI5ZjEgWmh1
IExpbmdzaGFuIDIwMjAtMDUtMjYgIDMyMSAgCXN0cnVjdCB2aG9zdF92cmluZ19maWxlIGY7Cj4g
YTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjYgIDMyMiAgCWxvbmcgcjsKPiBh
ODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAgMzIzCj4gYTg0ZGRiZjFlZjI5
ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjYgIDMyNCAgCWlmIChjb3B5X2Zyb21fdXNlcigmZiwg
YXJncCwgc2l6ZW9mKGYpKSkKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0y
NiAgMzI1ICAJCXJldHVybiAtRUZBVUxUOwo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAy
MDIwLTA1LTI2ICAzMjYKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAg
MzI3ICAJZXZlbnRmcCA9IGYuZmQgPT0gLTEgPyBOVUxMIDogZXZlbnRmZF9mZ2V0KGYuZmQpOwo+
IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2ICAzMjggIAlpZiAoSVNfRVJS
KGV2ZW50ZnApKSB7Cj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjYgIDMy
OSAgCQlyID0gUFRSX0VSUihldmVudGZwKTsKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4g
MjAyMC0wNS0yNiAgMzMwICAJCXJldHVybiByOwo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hh
biAyMDIwLTA1LTI2ICAzMzEgIAl9Cj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAt
MDUtMjYgIDMzMgo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2ICAzMzMg
IAlpZiAoZXZlbnRmcCAhPSB2cS0+a2ljaykgewo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hh
biAyMDIwLTA1LTI2ICAzMzQgIAkJcG9sbHN0b3AgPSAoZmlsZXAgPSB2cS0+a2ljaykgIT0gTlVM
TDsKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAgMzM1ICAJCXBvbGxz
dGFydCA9ICh2cS0+a2ljayA9IGV2ZW50ZnApICE9IE5VTEw7Cj4gYTg0ZGRiZjFlZjI5ZjEgWmh1
IExpbmdzaGFuIDIwMjAtMDUtMjYgIDMzNiAgCX0gZWxzZQo+IGE4NGRkYmYxZWYyOWYxIFpodSBM
aW5nc2hhbiAyMDIwLTA1LTI2ICAzMzcgIAkJZmlsZXAgPSBldmVudGZwOwo+IGE4NGRkYmYxZWYy
OWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2ICAzMzgKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGlu
Z3NoYW4gMjAyMC0wNS0yNiAgMzM5ICAJaWYgKHBvbGxzdG9wICYmIHZxLT5oYW5kbGVfa2ljaykK
PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAgMzQwICAJCXZob3N0X3Zk
cGFfcG9sbF9zdG9wKHZxKTsKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0y
NiAgMzQxCj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjYgIDM0MiAgCWlm
IChmaWxlcCkKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAgMzQzICAJ
CWZwdXQoZmlsZXApOwo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2ICAz
NDQKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNiAgMzQ1ICAJaWYgKHBv
bGxzdGFydCAmJiB2cS0+aGFuZGxlX2tpY2spCj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFu
IDIwMjAtMDUtMjYgIDM0NiAgCQlyID0gdmhvc3RfdmRwYV9wb2xsX3N0YXJ0KHZxKTsKPgo+ICJy
IiBub3QgaW5pdGlhbGl6ZWQgb24gZWxzZSBwYXRoLgo+Cj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExp
bmdzaGFuIDIwMjAtMDUtMjYgIDM0Nwo+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIw
LTA1LTI2IEAzNDggIAlyZXR1cm4gcjsKPiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAy
MC0wNS0yNiAgMzQ5ICB9CgoKV2lsbCBmaXguCgpUaGFua3MKCgo+IC0tLQo+IDAtREFZIENJIEtl
cm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cHM6Ly9saXN0cy4wMS5v
cmcvaHlwZXJraXR0eS9saXN0L2tidWlsZC1hbGxAbGlzdHMuMDEub3JnCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
