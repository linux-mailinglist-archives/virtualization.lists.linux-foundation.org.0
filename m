Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9B7ACAD
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 17:48:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 706E52FF6;
	Tue, 30 Jul 2019 15:48:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78C032FBD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 15:38:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ED732F1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 15:38:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h19so45583008wme.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 08:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=+V7Ycpw0BpHnpfdUJNk0+mUgrmqws4rmdWBhU3jRPak=;
	b=tdoPp5y3ZzzeFhCCLMpO87Q5nrwtraL6d1vuRD3suVG+Z2IBO8d72/xrjavMwRzQW1
	RrQI3R6UEn3tjemdc7TuCmpee/FX2jySuqaezjS3v+0irwA/iSDe/GmgMpztZC9u3Que
	LpbqHdy9FcRlcXHvx8jWpHADP0jfaMfb2qoHLiOPEnrtfm8EXcRFCl5NhMjuRnlCKrVd
	9uko88sREfkPCzRdrAN85BiwGTjhz9u7BdIARQzw6JS5vDwDqtSRoF/z+H8HkrGyQxGL
	gATwyn7LwrnoSkDG02PVDnAk9vSqOS0ntw7xgFyjg0nA4xkBVtt7foBGEr5LePrc9YH/
	pC9A==
X-Gm-Message-State: APjAAAVnWA3deKmbV1CDQThe74or7Gp0+PbrQsbpnSX9cjsaEjBQ9VWm
	uYycwPBgjFBS4Bheovhsm/jY9A==
X-Google-Smtp-Source: APXvYqzl/+3onAWYKDAvYxlWjOt0dpZaL10v8LdZHXOcP0ynq8N8FAuHDBrbBG+gxlVDb61R4WP+1w==
X-Received: by 2002:a1c:2d8b:: with SMTP id
	t133mr105582983wmt.57.1564501086525; 
	Tue, 30 Jul 2019 08:38:06 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	b19sm46496455wmj.13.2019.07.30.08.38.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 08:38:05 -0700 (PDT)
Date: Tue, 30 Jul 2019 17:38:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190730153803.qxilmuvaylzyeqi4@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190729095743-mutt-send-email-mst@kernel.org>
	<20190730094013.ruqjllqrjmkdnh5y@steredhat>
	<fc568e3d-7af5-5895-89e8-32e35b0f9af4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc568e3d-7af5-5895-89e8-32e35b0f9af4@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDY6MDM6MjRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMzAg5LiL5Y2INTo0MCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+ID4gT24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDk6NTk6MjNBTSAtMDQwMCwgTWljaGFlbCBT
LiBUc2lya2luIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwMTozMDoyNVBN
ICswMjAwLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gPiA+ID4gVGhpcyBzZXJpZXMgdHJp
ZXMgdG8gaW5jcmVhc2UgdGhlIHRocm91Z2hwdXQgb2YgdmlydGlvLXZzb2NrIHdpdGggc2xpZ2h0
Cj4gPiA+ID4gY2hhbmdlcy4KPiA+ID4gPiBXaGlsZSBJIHdhcyB0ZXN0aW5nIHRoZSB2MiBvZiB0
aGlzIHNlcmllcyBJIGRpc2NvdmVyZWQgYW4gaHVnZSB1c2Ugb2YgbWVtb3J5LAo+ID4gPiA+IHNv
IEkgYWRkZWQgcGF0Y2ggMSB0byBtaXRpZ2F0ZSB0aGlzIGlzc3VlLiBJIHB1dCBpdCBpbiB0aGlz
IHNlcmllcyBpbiBvcmRlcgo+ID4gPiA+IHRvIGJldHRlciB0cmFjayB0aGUgcGVyZm9ybWFuY2Ug
dHJlbmRzLgo+ID4gPiBTZXJpZXM6Cj4gPiA+IAo+ID4gPiBBY2tlZC1ieTogTWljaGFlbCBTLiBU
c2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiA+ID4gCj4gPiA+IENhbiB0aGlzIGdvIGludG8gbmV0
LW5leHQ/Cj4gPiA+IAo+ID4gSSB0aGluayBzby4KPiA+IE1pY2hhZWwsIFN0ZWZhbiB0aGFua3Mg
dG8gYWNrIHRoZSBzZXJpZXMhCj4gPiAKPiA+IFNob3VsZCBJIHJlc2VuZCBpdCB3aXRoIG5ldC1u
ZXh0IHRhZz8KPiA+IAo+ID4gVGhhbmtzLAo+ID4gU3RlZmFubwo+IAo+IAo+IEkgdGhpbmsgc28u
CgpPa2F5LCBJJ2xsIHJlc2VuZCBpdCEKClRoYW5rcywKU3RlZmFubwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
