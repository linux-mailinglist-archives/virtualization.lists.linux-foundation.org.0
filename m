Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BE6154E
	for <lists.virtualization@lfdr.de>; Sun,  7 Jul 2019 16:44:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9B4731E5A;
	Sun,  7 Jul 2019 14:44:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 93B7E1E15
	for <virtualization@lists.linux-foundation.org>;
	Sun,  7 Jul 2019 14:37:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C53F987C
	for <virtualization@lists.linux-foundation.org>;
	Sun,  7 Jul 2019 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org;
	s=ds201810; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LcD1w/liYZACECaSS/HfP2WOvQp/HexR/xuj0X2AePU=; 
	b=IWrDvfZcNa5xzbZ2hjzdcBN7I9WqLDBeEV/1qKh1in78UlcdGL6sFLw8AvupkEdDiUvlNdGQ6ns0pCI1emi5hJs5hFAbAgxJIx/6/Rfs3jX/yH7CTAqwhitZV2GCOB2uMZNnL9tmbyV3AJCkLG2xjdkQ4Q1/iWR0AJyGo8AJkXwTFZhEMQ4h9Dfcz95XP1AT/ML7CRdcVoOAZ6d6rd1JH662haZgTuJT3WEP4+oUKMsYO3A8nYO47UBvV1Fj9WGU+tmvqYKhxIGHpLjsF/yuTD/dPugChkQrLgkTVnwqIYl6cTSUbDZTNTvAImglH8WWOJHTbZd5jtaBnePTkMoSgQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61683
	helo=[192.168.10.173]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <noralf@tronnes.org>)
	id 1hk8Hr-0001Cc-MZ; Sun, 07 Jul 2019 16:37:07 +0200
Subject: Re: [PATCH v2 3/6] drm/fb-helper: Instanciate shadow FB if configured
	in device's mode_config
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
	daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com, 
	maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
	yc_chen@aspeedtech.com
References: <20190705092613.7621-1-tzimmermann@suse.de>
	<20190705092613.7621-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <68f5783f-8022-3238-a6d9-c6a774b39633@tronnes.org>
Date: Sun, 7 Jul 2019 16:37:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705092613.7621-4-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

CgpEZW4gMDUuMDcuMjAxOSAxMS4yNiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gR2VuZXJp
YyBmcmFtZWJ1ZmZlciBlbXVsYXRpb24gdXNlcyBhIHNoYWRvdyBidWZmZXIgZm9yIGZyYW1lYnVm
ZmVycyB3aXRoCj4gZGlydHkoKSBmdW5jdGlvbi4gSWYgZHJpdmVycyB3YW50IHRvIHVzZSB0aGUg
c2hhZG93IEZCIHdpdGhvdXQgc3VjaCBhCj4gZnVuY3Rpb24sIHRoZXkgY2FuIG5vdyBzZXQgcHJl
ZmVyX3NoYWRvdyBvciBwcmVmZXJfc2hhZG93X2ZiZGV2IGluIHRoZWlyCj4gbW9kZV9jb25maWcg
c3RydWN0dXJlcy4gVGhlIGZvcm1lciBmbGFnIGlzIGV4cG9ydGVkIHRvIHVzZXJzcGFjZSwgdGhl
IGxhdHRlcgo+IGZsYWcgaXMgZmJkZXYtb25seS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KPiAgaW5jbHVkZS9kcm0v
ZHJtX21vZGVfY29uZmlnLmggICB8ICA1ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiBp
bmRleCA3YmE2YTAyNTU4MjEuLjU2ZWYxNjllMTgxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYwo+IEBAIC00MjEsNyArNDIxLDkgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0
eV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCQkJCXJldHVybjsKPiAgCQkJZHJt
X2ZiX2hlbHBlcl9kaXJ0eV9ibGl0X3JlYWwoaGVscGVyLCAmY2xpcF9jb3B5KTsKPiAgCQl9Cj4g
LQkJaGVscGVyLT5mYi0+ZnVuY3MtPmRpcnR5KGhlbHBlci0+ZmIsIE5VTEwsIDAsIDAsICZjbGlw
X2NvcHksIDEpOwo+ICsJCWlmIChoZWxwZXItPmZiLT5mdW5jcy0+ZGlydHkpCj4gKwkJCWhlbHBl
ci0+ZmItPmZ1bmNzLT5kaXJ0eShoZWxwZXItPmZiLCBOVUxMLCAwLCAwLAo+ICsJCQkJCQkgJmNs
aXBfY29weSwgMSk7Cj4gIAo+ICAJCWlmIChoZWxwZXItPmJ1ZmZlcikKPiAgCQkJZHJtX2NsaWVu
dF9idWZmZXJfdnVubWFwKGhlbHBlci0+YnVmZmVyKTsKPiBAQCAtNjIwLDkgKzYyMiw2IEBAIHN0
YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGlydHkoc3RydWN0IGZiX2luZm8gKmluZm8sIHUzMiB4
LCB1MzIgeSwKPiAgCXN0cnVjdCBkcm1fY2xpcF9yZWN0ICpjbGlwID0gJmhlbHBlci0+ZGlydHlf
Y2xpcDsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIAo+IC0JaWYgKCFoZWxwZXItPmZiLT5m
dW5jcy0+ZGlydHkpCj4gLQkJcmV0dXJuOwoKZHJtX2ZiX2hlbHBlcl9kaXJ0eSgpIGlzIGNhbGxl
ZCB1bmNvbmRpdGlvbmFsbHkgYnkKZHJtX2ZiX2hlbHBlcl9zeXNfaW1hZ2VibGl0KCkgZXQgYWws
IHNvIHdlIG5lZWQgY2hlY2sgd2l0aApkcm1fZmJkZXZfdXNlX3NoYWRvd19mYigpIGhlcmUuCgo+
IC0KPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZoZWxwZXItPmRpcnR5X2xvY2ssIGZsYWdzKTsKPiAg
CWNsaXAtPngxID0gbWluX3QodTMyLCBjbGlwLT54MSwgeCk7Cj4gIAljbGlwLT55MSA9IG1pbl90
KHUzMiwgY2xpcC0+eTEsIHkpOwo+IEBAIC0yMTY2LDYgKzIxNjUsMTYgQEAgc3RhdGljIHN0cnVj
dCBmYl9kZWZlcnJlZF9pbyBkcm1fZmJkZXZfZGVmaW8gPSB7Cj4gIAkuZGVmZXJyZWRfaW8JPSBk
cm1fZmJfaGVscGVyX2RlZmVycmVkX2lvLAo+ICB9Owo+ICAKPiArc3RhdGljIGJvb2wgZHJtX2Zi
ZGV2X3VzZV9zaGFkb3dfZmIoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKPiArewo+
ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZiX2hlbHBlci0+ZGV2Owo+ICsJc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqZmIgPSBmYl9oZWxwZXItPmZiOwo+ICsKPiArCXJldHVybiBkZXYtPm1v
ZGVfY29uZmlnLnByZWZlcl9zaGFkb3dfZmJkZXYgfAo+ICsJICAgICAgIGRldi0+bW9kZV9jb25m
aWcucHJlZmVyX3NoYWRvdyB8CgpVc2UgbG9naWNhbCBPUiBoZXJlCgo+ICsJICAgICAgICEhZmIt
PmZ1bmNzLT5kaXJ0eTsKCmFuZCB5b3UgY2FuIGRyb3AgdGhlIHRoZSBkb3VibGUgTk9UIGhlcmUu
Cgo+ICt9Cj4gKwo+ICAvKioKPiAgICogZHJtX2ZiX2hlbHBlcl9nZW5lcmljX3Byb2JlIC0gR2Vu
ZXJpYyBmYmRldiBlbXVsYXRpb24gcHJvYmUgaGVscGVyCj4gICAqIEBmYl9oZWxwZXI6IGZiZGV2
IGhlbHBlciBzdHJ1Y3R1cmUKPiBAQCAtMjIxMyw3ICsyMjIyLDcgQEAgaW50IGRybV9mYl9oZWxw
ZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLAo+ICAKPiAg
CWRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKGZiaSwgZmJfaGVscGVyLCBzaXplcyk7Cj4gIAo+IC0J
aWYgKGZiLT5mdW5jcy0+ZGlydHkpIHsKPiArCWlmIChkcm1fZmJkZXZfdXNlX3NoYWRvd19mYihm
Yl9oZWxwZXIpKSB7Cj4gIAkJc3RydWN0IGZiX29wcyAqZmJvcHM7Cj4gIAkJdm9pZCAqc2hhZG93
Owo+ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNs
dWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAo+IGluZGV4IDc1OWQ0NjJkMDI4Yi4uZTFjNzUxYWNh
MzUzIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPiBAQCAtMzQ3LDYgKzM0Nyw4IEBAIHN0cnVj
dCBkcm1fbW9kZV9jb25maWdfZnVuY3Mgewo+ICAgKiBAb3V0cHV0X3BvbGxfd29yazogZGVsYXll
ZCB3b3JrIGZvciBwb2xsaW5nIGluIHByb2Nlc3MgY29udGV4dAo+ICAgKiBAcHJlZmVycmVkX2Rl
cHRoOiBwcmVmZXJyZWQgUkJHIHBpeGVsIGRlcHRoLCB1c2VkIGJ5IGZiIGhlbHBlcnMKPiAgICog
QHByZWZlcl9zaGFkb3c6IGhpbnQgdG8gdXNlcnNwYWNlIHRvIHByZWZlciBzaGFkb3ctZmIgcmVu
ZGVyaW5nCj4gKyAqIEBwcmVmZXJfc2hhZG93X2ZiZGV2OiBoaW50IHRvIGZyYW1lYnVmZmVyIGVt
dWxhdGlvbiB0byBwcmVmZXIgc2hhZG93LWZiIFwKPiArCXJlbmRlcmluZwoKSXQncyBwcmVmZXJy
ZWQgdG8gaGF2ZSB0aGUgZG9jIHRvZ2V0aGVyIHdpdGggdGhlIHN0cnVjdCBtZW1iZXIuIFRoaXMg
d2F5Cml0J3MgbGVzcyBsaWtlbHkgdG8gYmUgZm9yZ290dGVuIHdoZW4gdGhpbmdzIGNoYW5nZS4g
QW5kIHdlIGRvbid0IHVzZQpsaW5lIGNvbnQuIHdoZW4gdGhlIGRvYyBsaW5lIGlzIHRvbyBsb25n
LiBKdXN0IGNvbnRpbnVlIG9uIHRoZSBuZXh0IGxpbmUKYWZ0ZXIgYW4gYXN0ZXJpeC4KCj4gICAq
IEBjdXJzb3Jfd2lkdGg6IGhpbnQgdG8gdXNlcnNwYWNlIGZvciBtYXggY3Vyc29yIHdpZHRoCj4g
ICAqIEBjdXJzb3JfaGVpZ2h0OiBoaW50IHRvIHVzZXJzcGFjZSBmb3IgbWF4IGN1cnNvciBoZWln
aHQKPiAgICogQGhlbHBlcl9wcml2YXRlOiBtaWQtbGF5ZXIgcHJpdmF0ZSBkYXRhCj4gQEAgLTg1
Miw2ICs4NTQsOSBAQCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnIHsKPiAgCS8qIGR1bWIgaW9jdGwg
cGFyYW1ldGVycyAqLwo+ICAJdWludDMyX3QgcHJlZmVycmVkX2RlcHRoLCBwcmVmZXJfc2hhZG93
Owo+ICAKPiArCS8qIGZiZGV2IHBhcmFtZXRlcnMgKi8KCk5vIG5lZWQgZm9yIHRoaXMgY29tbWVu
dC4KCkRvYyBjYW4gbG9vayBsaWtlIHRoaXMsIEkndmUgZG9uZSBzL2ZyYW1lYnVmZmVyL2ZiZGV2
LzoKCS8qKgoJICogQHByZWZlcl9zaGFkb3dfZmJkZXY6CgkgKgoJICogSGludCB0byBmYmRldiBl
bXVsYXRpb24gdG8gcHJlZmVyIHNoYWRvdy1mYiByZW5kZXJpbmcuCgkgKi8KCj4gKwl1aW50MzJf
dCBwcmVmZXJfc2hhZG93X2ZiZGV2OwoKVXNlIGJvb2wgaGVyZS4KCldpdGggdGhhdDoKClJldmll
d2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KCkkgaGF2ZSB0ZXN0
ZWQgdGhpcyBvbiAyIGRyaXZlcnMgdGhhdCB1c2UgZ2VuZXJpYyBmYmRldjogdmM0IChubyBzaGFk
b3cKYnVmKSBhbmQgbWkwMjgzcXQgd2hpY2ggaGFzIGEgZGlydHkgY2FsbGJhY2suCgpUZXN0ZWQt
Ynk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKPiArCj4gIAkvKioKPiAg
CSAqIEBxdWlya19hZGRmYl9wcmVmZXJfeGJncl8zMGJwcDoKPiAgCSAqCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
