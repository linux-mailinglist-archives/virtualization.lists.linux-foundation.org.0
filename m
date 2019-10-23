Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 38105E1F90
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 17:40:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66553BE7;
	Wed, 23 Oct 2019 15:40:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40895BA4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 15:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0D1828A9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 15:40:44 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id o198so2311751vko.11
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9h2bLlE5uiElXoN05sFkiX8cpYZeJb4T7lrsDWBorqE=;
	b=dz7Jck3bJtS+Q3i9sActcxjLeaJGGZ6fDfedCIA5pyBgDY4IPDQlFJhFT21PyFismE
	lq+2IGol/AMrZDdrr/b3ffMHRJFC52qLVAGiGon/4WQ5Xc8t/YNJJhAdAs1MjtOYDBk+
	TX8WITu1cQTk9oydx2umzGy06BmwQ70PMg3XGDSe/7GlL49s2H9D4xe7s8NeP5HkMsPs
	tMaF+Pnj7Wtowr4+u4wia30/J126VfShkz5+oSnX5MzcnbBJzRSwLdoRNMwjkZf33Oww
	Xy9N/L4lrnflRTgMoPwuOJjRTGIPCSp3w9LP9yOqhD73tobsarHI8UyVJU+9FyxiYBwP
	XifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9h2bLlE5uiElXoN05sFkiX8cpYZeJb4T7lrsDWBorqE=;
	b=IxJDROkE/NL2m+X927OSVaIb3GKqKw2m98RY5k+zXxNL9exlkAdRfkyJx9rn+sx9Y2
	p7JZs1XsuC3wEaO50Rl6zSQedwhXqti6qVjc597r/490rar3rKC1mcuusz+kRQoxcXK3
	eC9h9/j7MZYTGHoqJsnjw+w3j8Y1Y+E5Mcn8U/+WHdZ7CSOCmvQY16Gch9X4cRxKPyIs
	Q/L6R8YDv+R4hENOTp6pOn1mW6qwP/fe9fhR0dgM4XEPHtM0ET87YIjatE4z4AXxtVaP
	1yMmkOHBGA3MkbPztPn9WevDTJCq5gI7iTnG7IFcjFymvECCYUF6aNsbTl8bGtk1pd7g
	Tulg==
X-Gm-Message-State: APjAAAVYhotomlMMrs7bhqbL+jfPq9MSB+3iktP24qP9ldmKdxgYMwSv
	y6U5X/SJmfwD903Sw3tUkAZ5Mh6Jx/juCOnB4XBjTQ==
X-Google-Smtp-Source: APXvYqzaMIBdBVepIccYwBzdNqs3rmPjsUfK3AV3PIIRWofrSco90CTOzOVF8tSUUK/baA5la1UAjuL99PuFgJcw5Lo=
X-Received: by 2002:a1f:944a:: with SMTP id w71mr3666213vkd.60.1571845243467; 
	Wed, 23 Oct 2019 08:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191023101256.20509-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191023101256.20509-1-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2019 17:40:32 +0200
Message-ID: <CACRpkdYfh=9oextiC1rtQ2UQ72OW_0TqjCe4AmvRtXKVv_ZazQ@mail.gmail.com>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Emil Velikov <emil.velikov@collabora.com>
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

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTI6MTMgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cgo+IFBhc3NpbmcgdGhlIHdyb25nIHR5cGUgZmVlbHMgaWNr
eSwgZXZlcnl3aGVyZSBlbHNlIHdlIHVzZSB0aGUgcGlwZSBhcwo+IHRoZSBmaXJzdCBwYXJhbWV0
ZXIuIFNwb3R0ZWQgd2hpbGUgZGlzY3Vzc2luZyBwYXRjaGVzIHdpdGggVGhvbWFzCj4gWmltbWVy
bWFubi4KPgo+IHYyOiBNYWtlIHhlbiBjb21waWxlIGNvcnJlY3RseQo+Cj4gQWNrZWQtQnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiAodjEpCj4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
Cj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KCk1ha2VzIHBlcmZlY3Qgc2Vuc2UuClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
