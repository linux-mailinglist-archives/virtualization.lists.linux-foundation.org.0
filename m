Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB428122C
	for <lists.virtualization@lfdr.de>; Fri,  2 Oct 2020 14:22:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 05A23204F0;
	Fri,  2 Oct 2020 12:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwTfmlhhPpqS; Fri,  2 Oct 2020 12:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A1E5C204BE;
	Fri,  2 Oct 2020 12:21:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70914C0051;
	Fri,  2 Oct 2020 12:21:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 323B8C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 12:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18A4386F7F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 12:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMVoBZuJfcA0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 12:21:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7BD5886F58
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 12:21:50 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u126so998941oif.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 02 Oct 2020 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nq01YQB/Ez2vk6AHKtzJbl9d7KNOzLFVdp79wE51CO8=;
 b=J12pA5IJOFyOzjsDJPKdd6yyPZIZfVAEncJfiqCeIoXA7GJuyjOTP3zk36pG4sXCDo
 BOHRSyus9vk6/D/9OKVWSYZ/rY3ITRY7ycjHPZy2rk4H1c6WIH6oGLrJESrODULrP2i2
 GziR9uC9x/6das0oQJVqKJFpyGG1FXcoaBc90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nq01YQB/Ez2vk6AHKtzJbl9d7KNOzLFVdp79wE51CO8=;
 b=PTG9aHilcX7EiaJFO73jtGoxe3hbALTKdWvyFumpDlojPKWwRbJ+fm/tBBWz+ZGZ20
 /aESOFQEt68JhyIxxLJD+dPTC6HYwNceQedaQ4Yuse6g7bgsB1XS0gQPzVxY82P03DZH
 sutdcWvEyLKH77IbfNfHLI8gzHMnTj8igNneFV3T2qgpCiyCnNFhofHKCg0oGangZnci
 gf+GRLrpmtkyEbLftBeR/pISYXJ84lzrH2VwGtiF++LjrANZrE+MDRHVTNg1xWHEa4b3
 pWV0Slnk7KbfU0RWM9waGl3uHUHgplZNUr/BJyBxYqLy4uoph0Bc/Bva4SZN/+9iLTkM
 wlvA==
X-Gm-Message-State: AOAM532Q9T7lvucGd2P6a+m40R4kOHALcjYOCv7NOHphryP07g2nYi9x
 7I10o1JVy2cNLwsSmxSsRk3MJjgNJwE3eWP/blK4KA==
X-Google-Smtp-Source: ABdhPJz13UBI/oM9lY3EXtCelg6/RnKqvJM+aoU58aNwPxLtuE8ga2NpAfnpgTIovLJFzgeyQpyPKfJaWsGFjW9eTPc=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr1062489oie.128.1601641309381; 
 Fri, 02 Oct 2020 05:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local>
 <f6dcba12-8be8-b867-ac9b-a1ba50567fca@gmail.com>
In-Reply-To: <f6dcba12-8be8-b867-ac9b-a1ba50567fca@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Oct 2020 14:21:38 +0200
Message-ID: <CAKMK7uHMU9X_V_gHmnVB=Jabb_p-01MQcQ4bZAnN1Sk1JMqkKg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 "Anholt, Eric" <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Kukjin Kim <kgene@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
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

T24gRnJpLCBPY3QgMiwgMjAyMCBhdCAxOjMwIFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIDAyLjEwLjIwIHVtIDExOjU4
IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDAyOjUx
OjQ2UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPj4gT24gV2VkLCBTZXAgMzAsIDIw
MjAgYXQgMjozNCBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPj4gPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4gd3JvdGU6Cj4gPj4+IEFtIDMwLjA5LjIwIHVtIDExOjQ3IHNjaHJpZWIgRGFuaWVsIFZl
dHRlcjoKPiA+Pj4+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDEwOjM0OjMxQU0gKzAyMDAsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPj4+Pj4gQW0gMzAuMDkuMjAgdW0gMTA6MTkgc2Nocmll
YiBUaG9tYXMgWmltbWVybWFubjoKPiA+Pj4+Pj4gSGkKPiA+Pj4+Pj4KPiA+Pj4+Pj4gQW0gMzAu
MDkuMjAgdW0gMTA6MDUgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4+Pj4+Pj4gQW0gMjku
MDkuMjAgdW0gMTk6NDkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiA+Pj4+Pj4+PiBIaSBD
aHJpc3RpYW4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEFtIDI5LjA5LjIwIHVtIDE3OjM1IHNjaHJp
ZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiA+Pj4+Pj4+Pj4gQW0gMjkuMDkuMjAgdW0gMTc6MTQgc2No
cmllYiBUaG9tYXMgWmltbWVybWFubjoKPiA+Pj4+Pj4+Pj4+IFRoZSBuZXcgaGVscGVyIHR0bV9r
bWFwX29ial90b19kbWFfYnVmKCkgZXh0cmFjdHMgYWRkcmVzcyBhbmQgbG9jYXRpb24KPiA+Pj4+
Pj4+Pj4+IGZyb20gYW5kIGluc3RhbmNlIG9mIFRUTSdzIGttYXBfb2JqIGFuZCBpbml0aWFsaXpl
cyBzdHJ1Y3QgZG1hX2J1Zl9tYXAKPiA+Pj4+Pj4+Pj4+IHdpdGggdGhlc2UgdmFsdWVzLiBIZWxw
ZnVsIGZvciBUVE0tYmFzZWQgZHJpdmVycy4KPiA+Pj4+Pj4+Pj4gV2UgY291bGQgY29tcGxldGVs
eSBkcm9wIHRoYXQgaWYgd2UgdXNlIHRoZSBzYW1lIHN0cnVjdHVyZSBpbnNpZGUgVFRNIGFzCj4g
Pj4+Pj4+Pj4+IHdlbGwuCj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IEFkZGl0aW9uYWwgdG8gdGhh
dCB3aGljaCBkcml2ZXIgaXMgZ29pbmcgdG8gdXNlIHRoaXM/Cj4gPj4+Pj4+Pj4gQXMgRGFuaWVs
IG1lbnRpb25lZCwgaXQncyBpbiBwYXRjaCAzLiBUaGUgVFRNLWJhc2VkIGRyaXZlcnMgd2lsbAo+
ID4+Pj4+Pj4+IHJldHJpZXZlIHRoZSBwb2ludGVyIHZpYSB0aGlzIGZ1bmN0aW9uLgo+ID4+Pj4+
Pj4+Cj4gPj4+Pj4+Pj4gSSBkbyB3YW50IHRvIHNlZSBhbGwgdGhhdCBiZWluZyBtb3JlIHRpZ2h0
bHkgaW50ZWdyYXRlZCBpbnRvIFRUTSwgYnV0Cj4gPj4+Pj4+Pj4gbm90IGluIHRoaXMgc2VyaWVz
LiBUaGlzIG9uZSBpcyBhYm91dCBmaXhpbmcgdGhlIGJvY2hzLW9uLXNwYXJjNjQKPiA+Pj4+Pj4+
PiBwcm9ibGVtIGZvciBnb29kLiBQYXRjaCA3IGFkZHMgYW4gdXBkYXRlIHRvIFRUTSB0byB0aGUg
RFJNIFRPRE8gbGlzdC4KPiA+Pj4+Pj4+IEkgc2hvdWxkIGhhdmUgYXNrZWQgd2hpY2ggZHJpdmVy
IHlvdSB0cnkgdG8gZml4IGhlcmUgOikKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBJbiB0aGlzIGNhc2Ug
anVzdCBrZWVwIHRoZSBmdW5jdGlvbiBpbnNpZGUgYm9jaHMgYW5kIG9ubHkgZml4IGl0IHRoZXJl
Lgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEFsbCBvdGhlciBkcml2ZXJzIGNhbiBiZSBmaXhlZCB3aGVu
IHdlIGdlbmVyYWxseSBwdW1wIHRoaXMgdGhyb3VnaCBUVE0uCj4gPj4+Pj4+IERpZCB5b3UgdGFr
ZSBhIGxvb2sgYXQgcGF0Y2ggMz8gVGhpcyBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgYnkgVlJBTQo+
ID4+Pj4+PiBoZWxwZXJzLCBub3V2ZWF1LCByYWRlb24sIGFtZGdwdSBhbmQgcXhsLiBJZiB3ZSBk
b24ndCBwdXQgaXQgaGVyZSwgd2UKPiA+Pj4+Pj4gaGF2ZSB0byBkdXBsaWNhdGUgdGhlIGZ1bmN0
aW9uYWxpdHkgaW4gZWFjaCBpZiB0aGVzZSBkcml2ZXJzLiBCb2Nocwo+ID4+Pj4+PiBpdHNlbGYg
dXNlcyBWUkFNIGhlbHBlcnMgYW5kIGRvZXNuJ3QgdG91Y2ggdGhlIGZ1bmN0aW9uIGRpcmVjdGx5
Lgo+ID4+Pj4+IEFoLCBvayBjYW4gd2UgaGF2ZSB0aGF0IHRoZW4gb25seSBpbiB0aGUgVlJBTSBo
ZWxwZXJzPwo+ID4+Pj4+Cj4gPj4+Pj4gQWx0ZXJuYXRpdmUgeW91IGNvdWxkIGdvIGFoZWFkIGFu
ZCB1c2UgZG1hX2J1Zl9tYXAgaW4gdHRtX2JvX2ttYXBfb2JqCj4gPj4+Pj4gZGlyZWN0bHkgYW5k
IGRyb3AgdGhlIGhhY2sgd2l0aCB0aGUgVFRNX0JPX01BUF9JT01FTV9NQVNLLgo+ID4+Pj4+Cj4g
Pj4+Pj4gV2hhdCBJIHdhbnQgdG8gYXZvaWQgaXMgdG8gaGF2ZSBhbm90aGVyIGNvbnZlcnNpb24g
ZnVuY3Rpb24gaW4gVFRNIGJlY2F1c2UKPiA+Pj4+PiB3aGF0IGhhcHBlbnMgaGVyZSBpcyB0aGF0
IHdlIGFscmVhZHkgY29udmVydCBmcm9tIHR0bV9idXNfcGxhY2VtZW50IHRvCj4gPj4+Pj4gdHRt
X2JvX2ttYXBfb2JqIGFuZCB0aGVuIHRvIGRtYV9idWZfbWFwLgo+ID4+Pj4gSG0gSSdtIG5vdCBy
ZWFsbHkgc2VlaW5nIGhvdyB0aGF0IGhlbHBzIHdpdGggYSBncmFkdWFsIGNvbnZlcnNpb24gb2YK
PiA+Pj4+IGV2ZXJ5dGhpbmcgb3ZlciB0byBkbWFfYnVmX21hcCBhbmQgYXNzb3J0ZWQgaGVscGVy
cyBmb3IgYWNjZXNzPyBUaGVyZSdzCj4gPj4+PiB0b28gbWFueSBwbGFjZXMgaW4gdHRtIGRyaXZl
cnMgd2hlcmUgaXNfaW9tZW0gYW5kIHJlbGF0ZWQgc3R1ZmYgaXMgdXNlZCB0bwo+ID4+Pj4gYmUg
YWJsZSB0byBjb252ZXJ0IGl0IGFsbCBpbiBvbmUgZ28uIEFuIGludGVybWVkaWF0ZSBzdGF0ZSB3
aXRoIGEgYnVuY2ggb2YKPiA+Pj4+IGNvbnZlcnNpb25zIHNlZW1zIGZhaXJseSB1bmF2b2lkYWJs
ZSB0byBtZS4KPiA+Pj4gRmFpciBlbm91Z2guIEkgd291bGQganVzdCBoYXZlIHN0YXJ0ZWQgYm90
dG9tIHVwIGFuZCBub3QgdG9wIGRvd24uCj4gPj4+Cj4gPj4+IEFueXdheSBmZWVsIGZyZWUgdG8g
Z28gYWhlYWQgd2l0aCB0aGlzIGFwcHJvYWNoIGFzIGxvbmcgYXMgd2UgY2FuIHJlbW92ZQo+ID4+
PiB0aGUgbmV3IGZ1bmN0aW9uIGFnYWluIHdoZW4gd2UgY2xlYW4gdGhhdCBzdHVmZiB1cCBmb3Ig
Z29vZC4KPiA+PiBZZWFoIEkgZ3Vlc3MgYm90dG9tIHVwIHdvdWxkIG1ha2UgbW9yZSBzZW5zZSBh
cyBhIHJlZmFjdG9yaW5nLiBCdXQgdGhlCj4gPj4gbWFpbiBtb3RpdmF0aW9uIHRvIGxhbmQgdGhp
cyBoZXJlIGlzIHRvIGZpeCB0aGUgX19tbWlvIHZzIG5vcm1hbAo+ID4+IG1lbW9yeSBjb25mdXNp
b24gaW4gdGhlIGZiZGV2IGVtdWxhdGlvbiBoZWxwZXJzIGZvciBzcGFyYyAoYW5kCj4gPj4gYW55
dGhpbmcgZWxzZSB0aGF0IG5lZWRzIHRoaXMpLiBIZW5jZSB0aGUgdG9wIGRvd24gYXBwcm9hY2gg
Zm9yCj4gPj4gcm9sbGluZyB0aGlzIG91dC4KPiA+IE9rIEkgc3RhcnRlZCByZXZpZXdpbmcgdGhp
cyBhIGJpdCBtb3JlIGluLWRlcHRoLCBhbmQgSSB0aGluayB0aGlzIGlzIGEgYml0Cj4gPiB0b28g
bXVjaCBvZiBhIGRlLXRvdXIuCj4gPgo+ID4gTG9va2luZyB0aHJvdWdoIGFsbCB0aGUgY2FsbGVy
cyBvZiB0dG1fYm9fa21hcCBhbG1vc3QgZXZlcnlvbmUgbWFwcyB0aGUKPiA+IGVudGlyZSBvYmpl
Y3QuIE9ubHkgdm13Z2Z4IHVzZXMgdG8gbWFwIGxlc3MgdGhhbiB0aGF0LiBBbHNvLCBldmVyeW9u
ZSBqdXN0Cj4gPiBpbW1lZGlhdGVseSBmb2xsb3dzIHVwIHdpdGggY29udmVydGluZyB0aGF0IGZ1
bGwgb2JqZWN0IG1hcCBpbnRvIGEKPiA+IHBvaW50ZXIuCj4gPgo+ID4gU28gSSB0aGluayB3aGF0
IHdlIHJlYWxseSB3YW50IGhlcmUgaXM6Cj4gPiAtIG5ldyBmdW5jdGlvbgo+ID4KPiA+IGludCB0
dG1fYm9fdm1hcChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3QgZG1hX2J1Zl9t
YXAgKm1hcCk7Cj4gPgo+ID4gICAgX3ZtYXAgbmFtZSBzaW5jZSB0aGF0J3MgY29uc2lzdGVudCB3
aXRoIGJvdGggZG1hX2J1ZiBmdW5jdGlvbnMgYW5kCj4gPiAgICB3aGF0J3MgdXN1YWxseSB1c2Vk
IHRvIGltcGxlbWVudCB0aGlzLiBPdXRzaWRlIG9mIHRoZSB0dG0gd29ybGQga21hcAo+ID4gICAg
dXN1YWxseSBqdXN0IG1lYW5zIHNpbmdsZS1wYWdlIG1hcHBpbmdzIHVzaW5nIGttYXAoKSBvciBp
dCdzIGlvbWVtCj4gPiAgICBzaWJsaW5nIGlvX21hcHBpbmdfbWFwKiBzbyByYXRoZXIgY29uZnVz
aW5nIG5hbWUgZm9yIGEgZnVuY3Rpb24gd2hpY2gKPiA+ICAgIHVzdWFsbHkgaXMganVzdCB1c2Vk
IHRvIHNldCB1cCBhIHZtYXAgb2YgdGhlIGVudGlyZSBidWZmZXIuCj4gPgo+ID4gLSBhIGhlbHBl
ciB3aGljaCBjYW4gYmUgdXNlZCBmb3IgdGhlIGRybV9nZW1fb2JqZWN0X2Z1bmNzIHZtYXAvdnVu
bWFwCj4gPiAgICBmdW5jdGlvbnMgZm9yIGFsbCB0dG0gZHJpdmVycy4gV2Ugc2hvdWxkIGJlIGFi
bGUgdG8gbWFrZSB0aGlzIGZ1bGx5Cj4gPiAgICBnZW5lcmljIGJlY2F1c2UgYSkgd2Ugbm93IGhh
dmUgZG1hX2J1Zl9tYXAgYW5kIGIpIGRybV9nZW1fb2JqZWN0IGlzCj4gPiAgICBlbWJlZGRlZCBp
biB0aGUgdHRtX2JvLCBzbyB3ZSBjYW4gdXBjYXN0IGZvciBldmVyeW9uZSB3aG8ncyBib3RoIGEg
dHRtCj4gPiAgICBhbmQgZ2VtIGRyaXZlci4KPiA+Cj4gPiAgICBUaGlzIGlzIG1heWJlIGEgZ29v
ZCBmb2xsb3ctdXAsIHNpbmNlIGl0IHNob3VsZCBhbGxvdyB1cyB0byBkaXRjaCBxdWl0ZQo+ID4g
ICAgYSBiaXQgb2YgdGhlIHZyYW0gaGVscGVyIGNvZGUgZm9yIHRoaXMgbW9yZSBnZW5lcmljIHN0
dWZmLiBJIGFsc28gbWlnaHQKPiA+ICAgIGhhdmUgbWlzc2VkIHNvbWUgc3BlY2lhbC1jYXNlcyBo
ZXJlLCBidXQgZnJvbSBhIHF1aWNrIGxvb2sgZXZlcnl0aGluZwo+ID4gICAganVzdCBwaW5zIHRo
ZSBidWZmZXIgdG8gdGhlIGN1cnJlbnQgbG9jYXRpb24gYW5kIHRoYXQncyBpdC4KPiA+Cj4gPiAg
ICBBbHNvIHRoaXMgb2J2aW91c2x5IHJlcXVpcmVzIENocmlzdGlhbidzIGdlbmVyaWMgdHRtX2Jv
X3BpbiByZXdvcmsKPiA+ICAgIGZpcnN0Lgo+ID4KPiA+IC0gcm9sbCB0aGUgYWJvdmUgb3V0IHRv
IGRyaXZlcnMuCj4gPgo+ID4gQ2hyaXN0aWFuL1Rob21hcywgdGhvdWdodHMgb24gdGhpcz8KPgo+
IENhbGxpbmcgdGhpcyB2bWFwIGluc3RlYWQgb2Yga21hcCBjZXJ0YWlubHkgbWFrZXMgc2Vuc2Uu
Cj4KPiBOb3QgMTAwJSBzdXJlIGFib3V0IHRoZSBnZW5lcmljIGhlbHBlcnMsIGJ1dCBpdCBzb3Vu
ZHMgbGlrZSB0aGlzIHNob3VsZAo+IGluZGVlZCBsb29rIHJhdGhlciBjbGVhbiBpbiB0aGUgZW5k
LgoKWWVhaCBnZW5lcmljIGhlbHBlciBpcyBwcm9iYWJseSBiZXR0ZXIgbGVmdCBmb3IgYSBsYXRl
ciBzdGVwLCBhZnRlcgp3ZSd2ZSByb2xsZWQgb3V0IHR0bV9ib192bWFwIG91dCBldmVyeXdoZXJl
LgotRGFuaWVsCgo+Cj4gQ2hyaXN0aWFuLgo+Cj4gPgo+ID4gSSB0aGluayBmb3IgdGhlIGltbWVk
aWF0ZSBuZWVkIG9mIHJvbGxpbmcgdGhpcyBvdXQgZm9yIHZyYW0gaGVscGVycyBhbmQKPiA+IGZi
ZGV2IGNvZGUgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gdGhpcywgYnV0IGp1c3QgcG9zdHBvbmUg
dGhlIGRyaXZlciB3aWRlCj4gPiByb2xsLW91dCBmb3Igbm93Lgo+ID4KPiA+IENoZWVycywgRGFu
aWVsCj4gPgo+ID4+IC1EYW5pZWwKPiA+Pgo+ID4+PiBDaHJpc3RpYW4uCj4gPj4+Cj4gPj4+PiAt
RGFuaWVsCj4gPj4+Pgo+ID4+Pj4+IFRoYW5rcywKPiA+Pj4+PiBDaHJpc3RpYW4uCj4gPj4+Pj4K
PiA+Pj4+Pj4gQmVzdCByZWdhcmRzCj4gPj4+Pj4+IFRob21hcwo+ID4+Pj4+Pgo+ID4+Pj4+Pj4g
UmVnYXJkcywKPiA+Pj4+Pj4+IENocmlzdGlhbi4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gQmVzdCBy
ZWdhcmRzCj4gPj4+Pj4+Pj4gVGhvbWFzCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gUmVnYXJkcywK
PiA+Pj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPj4+Pj4+Pj4+
PiAtLS0KPiA+Pj4+Pj4+Pj4+ICAgICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCB8IDI0
ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4+Pj4+Pj4gICAgICBpbmNsdWRlL2xpbnV4
L2RtYS1idWYtbWFwLmggIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPiA+Pj4+Pj4+Pj4+ICAg
ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2FwaS5oCj4gPj4+Pj4+Pj4+PiBpbmRleCBjOTZhMjVkNTcxYzguLjYy
ZDg5ZjA1YTgwMSAxMDA2NDQKPiA+Pj4+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fYXBpLmgKPiA+Pj4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgK
PiA+Pj4+Pj4+Pj4+IEBAIC0zNCw2ICszNCw3IEBACj4gPj4+Pj4+Pj4+PiAgICAgICNpbmNsdWRl
IDxkcm0vZHJtX2dlbS5oPgo+ID4+Pj4+Pj4+Pj4gICAgICAjaW5jbHVkZSA8ZHJtL2RybV9oYXNo
dGFiLmg+Cj4gPj4+Pj4+Pj4+PiAgICAgICNpbmNsdWRlIDxkcm0vZHJtX3ZtYV9tYW5hZ2VyLmg+
Cj4gPj4+Pj4+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYtbWFwLmg+Cj4gPj4+Pj4+Pj4+
PiAgICAgICNpbmNsdWRlIDxsaW51eC9rcmVmLmg+Cj4gPj4+Pj4+Pj4+PiAgICAgICNpbmNsdWRl
IDxsaW51eC9saXN0Lmg+Cj4gPj4+Pj4+Pj4+PiAgICAgICNpbmNsdWRlIDxsaW51eC93YWl0Lmg+
Cj4gPj4+Pj4+Pj4+PiBAQCAtNDg2LDYgKzQ4NywyOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKnR0
bV9rbWFwX29ial92aXJ0dWFsKHN0cnVjdAo+ID4+Pj4+Pj4+Pj4gdHRtX2JvX2ttYXBfb2JqICpt
YXAsCj4gPj4+Pj4+Pj4+PiAgICAgICAgICByZXR1cm4gbWFwLT52aXJ0dWFsOwo+ID4+Pj4+Pj4+
Pj4gICAgICB9Cj4gPj4+Pj4+Pj4+PiAgICAgICsvKioKPiA+Pj4+Pj4+Pj4+ICsgKiB0dG1fa21h
cF9vYmpfdG9fZG1hX2J1Zl9tYXAKPiA+Pj4+Pj4+Pj4+ICsgKgo+ID4+Pj4+Pj4+Pj4gKyAqIEBr
bWFwOiBBIHN0cnVjdCB0dG1fYm9fa21hcF9vYmogcmV0dXJuZWQgZnJvbSB0dG1fYm9fa21hcC4K
PiA+Pj4+Pj4+Pj4+ICsgKiBAbWFwOiBSZXR1cm5zIHRoZSBtYXBwaW5nIGFzIHN0cnVjdCBkbWFf
YnVmX21hcAo+ID4+Pj4+Pj4+Pj4gKyAqCj4gPj4+Pj4+Pj4+PiArICogQ29udmVydHMgc3RydWN0
IHR0bV9ib19rbWFwX29iaiB0byBzdHJ1Y3QgZG1hX2J1Zl9tYXAuIElmIHRoZSBtZW1vcnkKPiA+
Pj4+Pj4+Pj4+ICsgKiBpcyBub3QgbWFwcGVkLCB0aGUgcmV0dXJuZWQgbWFwcGluZyBpcyBpbml0
aWFsaXplZCB0byBOVUxMLgo+ID4+Pj4+Pj4+Pj4gKyAqLwo+ID4+Pj4+Pj4+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCB0dG1fa21hcF9vYmpfdG9fZG1hX2J1Zl9tYXAoc3RydWN0IHR0bV9ib19rbWFw
X29iago+ID4+Pj4+Pj4+Pj4gKmttYXAsCj4gPj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4gPj4+Pj4+Pj4+PiArewo+ID4+Pj4+
Pj4+Pj4gKyAgICBib29sIGlzX2lvbWVtOwo+ID4+Pj4+Pj4+Pj4gKyAgICB2b2lkICp2YWRkciA9
IHR0bV9rbWFwX29ial92aXJ0dWFsKGttYXAsICZpc19pb21lbSk7Cj4gPj4+Pj4+Pj4+PiArCj4g
Pj4+Pj4+Pj4+PiArICAgIGlmICghdmFkZHIpCj4gPj4+Pj4+Pj4+PiArICAgICAgICBkbWFfYnVm
X21hcF9jbGVhcihtYXApOwo+ID4+Pj4+Pj4+Pj4gKyAgICBlbHNlIGlmIChpc19pb21lbSkKPiA+
Pj4+Pj4+Pj4+ICsgICAgICAgIGRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbShtYXAsICh2b2lk
IF9fZm9yY2UgX19pb21lbSAqKXZhZGRyKTsKPiA+Pj4+Pj4+Pj4+ICsgICAgZWxzZQo+ID4+Pj4+
Pj4+Pj4gKyAgICAgICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyKG1hcCwgdmFkZHIpOwo+ID4+Pj4+
Pj4+Pj4gK30KPiA+Pj4+Pj4+Pj4+ICsKPiA+Pj4+Pj4+Pj4+ICAgICAgLyoqCj4gPj4+Pj4+Pj4+
PiAgICAgICAqIHR0bV9ib19rbWFwCj4gPj4+Pj4+Pj4+PiAgICAgICAqCj4gPj4+Pj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLW1hcC5oIGIvaW5jbHVkZS9saW51eC9k
bWEtYnVmLW1hcC5oCj4gPj4+Pj4+Pj4+PiBpbmRleCBmZDFhYmE1NDVmZGYuLjJlOGJiZWNiNTA5
MSAxMDA2NDQKPiA+Pj4+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+
ID4+Pj4+Pj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLW1hcC5oCj4gPj4+Pj4+Pj4+
PiBAQCAtNDUsNiArNDUsMTIgQEAKPiA+Pj4+Pj4+Pj4+ICAgICAgICoKPiA+Pj4+Pj4+Pj4+ICAg
ICAgICogICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyKCZtYXAuIDB4ZGVhZGJlYWYpOwo+ID4+Pj4+
Pj4+Pj4gICAgICAgKgo+ID4+Pj4+Pj4+Pj4gKyAqIFRvIHNldCBhbiBhZGRyZXNzIGluIEkvTyBt
ZW1vcnksIHVzZSBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oKS4KPiA+Pj4+Pj4+Pj4+ICsg
Kgo+ID4+Pj4+Pj4+Pj4gKyAqIC4uIGNvZGUtYmxvY2s6OiBjCj4gPj4+Pj4+Pj4+PiArICoKPiA+
Pj4+Pj4+Pj4+ICsgKiAgICBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oJm1hcC4gMHhkZWFk
YmVhZik7Cj4gPj4+Pj4+Pj4+PiArICoKPiA+Pj4+Pj4+Pj4+ICAgICAgICogVGVzdCBpZiBhIG1h
cHBpbmcgaXMgdmFsaWQgd2l0aCBlaXRoZXIgZG1hX2J1Zl9tYXBfaXNfc2V0KCkgb3IKPiA+Pj4+
Pj4+Pj4+ICAgICAgICogZG1hX2J1Zl9tYXBfaXNfbnVsbCgpLgo+ID4+Pj4+Pj4+Pj4gICAgICAg
Kgo+ID4+Pj4+Pj4+Pj4gQEAgLTExOCw2ICsxMjQsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIGRt
YV9idWZfbWFwX3NldF92YWRkcihzdHJ1Y3QKPiA+Pj4+Pj4+Pj4+IGRtYV9idWZfbWFwICptYXAs
IHZvaWQgKnZhZGRyKQo+ID4+Pj4+Pj4+Pj4gICAgICAgICAgbWFwLT5pc19pb21lbSA9IGZhbHNl
Owo+ID4+Pj4+Pj4+Pj4gICAgICB9Cj4gPj4+Pj4+Pj4+PiAgICAgICsvKioKPiA+Pj4+Pj4+Pj4+
ICsgKiBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0gLSBTZXRzIGEgZG1hLWJ1ZiBtYXBwaW5n
IHN0cnVjdHVyZSB0bwo+ID4+Pj4+Pj4+Pj4gYW4gYWRkcmVzcyBpbiBJL08gbWVtb3J5Cj4gPj4+
Pj4+Pj4+PiArICogQG1hcDogICAgICAgIFRoZSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlCj4g
Pj4+Pj4+Pj4+PiArICogQHZhZGRyX2lvbWVtOiAgICBBbiBJL08tbWVtb3J5IGFkZHJlc3MKPiA+
Pj4+Pj4+Pj4+ICsgKgo+ID4+Pj4+Pj4+Pj4gKyAqIFNldHMgdGhlIGFkZHJlc3MgYW5kIHRoZSBJ
L08tbWVtb3J5IGZsYWcuCj4gPj4+Pj4+Pj4+PiArICovCj4gPj4+Pj4+Pj4+PiArc3RhdGljIGlu
bGluZSB2b2lkIGRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbShzdHJ1Y3QgZG1hX2J1Zl9tYXAg
Km1hcCwKPiA+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkIF9faW9t
ZW0gKnZhZGRyX2lvbWVtKQo+ID4+Pj4+Pj4+Pj4gK3sKPiA+Pj4+Pj4+Pj4+ICsgICAgbWFwLT52
YWRkcl9pb21lbSA9IHZhZGRyX2lvbWVtOwo+ID4+Pj4+Pj4+Pj4gKyAgICBtYXAtPmlzX2lvbWVt
ID0gdHJ1ZTsKPiA+Pj4+Pj4+Pj4+ICt9Cj4gPj4+Pj4+Pj4+PiArCj4gPj4+Pj4+Pj4+PiAgICAg
IC8qKgo+ID4+Pj4+Pj4+Pj4gICAgICAgKiBkbWFfYnVmX21hcF9pc19lcXVhbCAtIENvbXBhcmVz
IHR3byBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlcwo+ID4+Pj4+Pj4+Pj4gZm9yIGVxdWFsaXR5
Cj4gPj4+Pj4+Pj4+PiAgICAgICAqIEBsaHM6ICAgIFRoZSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0
dXJlCj4gPj4+Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPj4+Pj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+Pj4+Pj4+Pj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+Pj4+Pj4+PiBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5m
cmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9
MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNDcyYzNkNjU1YTYxNDExZGVi
NjcwOGQ4NjUyNWQxYjglN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0Mw
JTdDNjM3MzcwNTYwNDM4OTY1MDEzJmFtcDtzZGF0YT1IZEhPQSUyRjFWY0lYJTJGN1l0ZllUaUFx
WUV2dzdBZyUyRlMlMkJ4UzVWd0pLT3Y1eTAlM0QmYW1wO3Jlc2VydmVkPTAKPiA+Pj4+Pj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+Pj4+Pj4+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gPj4+Pj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+Pj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFu
JTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmln
JTQwYW1kLmNvbSU3QzQ3MmMzZDY1NWE2MTQxMWRlYjY3MDhkODY1MjVkMWI4JTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM3MDU2MDQzODk2NTAxMyZhbXA7
c2RhdGE9SCUyQjVIS0NzVHJrc1JWMkV5RWlGR1NUeVM3OWpzV0NtSmltU01vSll1c3g4JTNEJmFt
cDtyZXNlcnZlZD0wCj4gPj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+Pj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+Pj4+Pj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRh
PTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzQ3MmMzZDY1NWE2MTQxMWRl
YjY3MDhkODY1MjVkMWI4JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzM3MDU2MDQzODk2NTAxMyZhbXA7c2RhdGE9SGRIT0ElMkYxVmNJWCUyRjdZdGZZVGlB
cVlFdnc3QWclMkZTJTJCeFM1VndKS092NXkwJTNEJmFtcDtyZXNlcnZlZD0wCj4gPj4+Pj4+Pgo+
ID4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWls
bWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29l
bmlnJTQwYW1kLmNvbSU3QzQ3MmMzZDY1NWE2MTQxMWRlYjY3MDhkODY1MjVkMWI4JTdDM2RkODk2
MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM3MDU2MDQzODk2NTAxMyZh
bXA7c2RhdGE9SCUyQjVIS0NzVHJrc1JWMkV5RWlGR1NUeVM3OWpzV0NtSmltU01vSll1c3g4JTNE
JmFtcDtyZXNlcnZlZD0wCj4gPj4KPiA+PiAtLQo+ID4+IERhbmllbCBWZXR0ZXIKPiA+PiBTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiA+PiBodHRwOi8vYmxvZy5mZndsbC5j
aAo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
