Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B7089A4B03
	for <lists.virtualization@lfdr.de>; Sun,  1 Sep 2019 20:03:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BA4CC4CBB;
	Sun,  1 Sep 2019 18:02:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6C2E82ADB
	for <virtualization@lists.linux-foundation.org>;
	Sun,  1 Sep 2019 18:02:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E734C709
	for <virtualization@lists.linux-foundation.org>;
	Sun,  1 Sep 2019 18:02:52 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B2838535D
	for <virtualization@lists.linux-foundation.org>;
	Sun,  1 Sep 2019 18:02:52 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id b2so5170645qtt.10
	for <virtualization@lists.linux-foundation.org>;
	Sun, 01 Sep 2019 11:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=NtIlrG6bXqato3AHyRhqkP1r1EyQzXXXF+1WVjQfhrI=;
	b=aUX9ECLvAcDfrBfTUe7BuLqafkAX0mkV00RLBrv50eBZdkUnRkyb3nUp/PfCt99wxO
	YwhSGVM4EXzBIeFnOEpzIQOqjMwiGgLGjnsAbXoAQw7dhUEWueMdWSskcr9wkLae5NiC
	l8sAg3d1LIYlY3py8Bz84lbNLome5iYrbrxYkY2HL+uggvKbceZ2ClxpDkykOaCiJELI
	A5V3B35f6Y5uAF4v3sEneRQIAmHutiftBvgmitvCkEL4r8IP0bHIPOYewUniQri0snx5
	I+T9ylv53NAwoHw2bMSSBp+6JAQ1fgS8NHrHohWtdd8wodcl0W1ro6blS6lX5LMY+FVl
	0r/w==
X-Gm-Message-State: APjAAAWzCCiLyKaegZtMAbZW1tE6Pomykh8LTZOD0blwMXFE1Ypunu3g
	VLO+iro25U/jM4+v19zuB0YrKokxynv6mLjqbDUeapBqxC1JSDaa3fQ+nF800vb1cSL185ahRyd
	KSliG5pTlupR8vKVbSqyAboA724W7ZQb01DkuIbYsBA==
X-Received: by 2002:a37:480d:: with SMTP id v13mr24849053qka.295.1567360971409;
	Sun, 01 Sep 2019 11:02:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRyGzOcE8hglKRycEb420hPDRNv3fnUOZqre0cmbUtVArhzSlANFmNqbwZR2kZ23xgEdav+Q==
X-Received: by 2002:a37:480d:: with SMTP id v13mr24849044qka.295.1567360971215;
	Sun, 01 Sep 2019 11:02:51 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	i20sm5379783qkk.67.2019.09.01.11.02.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 11:02:49 -0700 (PDT)
Date: Sun, 1 Sep 2019 14:02:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190901140220-mutt-send-email-mst@kernel.org>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<663be71f-f96d-cfbc-95a0-da0ac6b82d9f@redhat.com>
	<20190819162733-mutt-send-email-mst@kernel.org>
	<9325de4b-1d79-eb19-306e-e7a8fa8cc1a5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9325de4b-1d79-eb19-306e-e7a8fa8cc1a5@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, jgg@ziepe.ca, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTA6Mjk6MzJBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMjAg5LiK5Y2INTowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6MTI6NDlQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS84LzEyIOS4i+WNiDU6NDksIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAxMDo0NDo1MUFNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS84LzExIOS4iuWNiDE6NTIsIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCBBdWcgMDksIDIwMTkg
YXQgMDE6NDg6NDJBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBIaSBh
bGw6Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhpcyBzZXJpZXMgdHJ5IHRvIGZpeCBz
ZXZlcmFsIGlzc3VlcyBpbnRyb2R1Y2VkIGJ5IG1ldGEgZGF0YQo+ID4gPiA+ID4gPiA+IGFjY2Vs
cmVhdGlvbiBzZXJpZXMuIFBsZWFzZSByZXZpZXcuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gQ2hhbmdlcyBmcm9tIFY0Ogo+ID4gPiA+ID4gPiA+IC0gc3dpdGNoIHRvIHVzZSBzcGlubG9j
ayBzeW5jaHJvbml6ZSBNTVUgbm90aWZpZXIgd2l0aCBhY2Nlc3NvcnMKPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiBDaGFuZ2VzIGZyb20gVjM6Cj4gPiA+ID4gPiA+ID4gLSByZW1vdmUgdGhl
IHVubmVjZXNzYXJ5IHBhdGNoCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBm
cm9tIFYyOgo+ID4gPiA+ID4gPiA+IC0gdXNlIHNlcWxjayBoZWxwZXIgdG8gc3luY2hyb25pemUg
TU1VIG5vdGlmaWVyIHdpdGggdmhvc3Qgd29ya2VyCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gQ2hhbmdlcyBmcm9tIFYxOgo+ID4gPiA+ID4gPiA+IC0gdHJ5IG5vdCB1c2UgUkNVIHRvIHN5
bmNyaG9uaXplIE1NVSBub3RpZmllciB3aXRoIHZob3N0IHdvcmtlcgo+ID4gPiA+ID4gPiA+IC0g
c2V0IGRpcnR5IHBhZ2VzIGFmdGVyIG5vIHJlYWRlcnMKPiA+ID4gPiA+ID4gPiAtIHJldHVybiAt
RUFHQUlOIG9ubHkgd2hlbiB3ZSBmaW5kIHRoZSByYW5nZSBpcyBvdmVybGFwcGVkIHdpdGgKPiA+
ID4gPiA+ID4gPiAgICAgIG1ldGFkYXRhCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSmFz
b24gV2FuZyAoOSk6Cj4gPiA+ID4gPiA+ID4gICAgICB2aG9zdDogZG9uJ3Qgc2V0IHVhZGRyIGZv
ciBpbnZhbGlkIGFkZHJlc3MKPiA+ID4gPiA+ID4gPiAgICAgIHZob3N0OiB2YWxpZGF0ZSBNTVUg
bm90aWZpZXIgcmVnaXN0cmF0aW9uCj4gPiA+ID4gPiA+ID4gICAgICB2aG9zdDogZml4IHZob3N0
IG1hcCBsZWFrCj4gPiA+ID4gPiA+ID4gICAgICB2aG9zdDogcmVzZXQgaW52YWxpZGF0ZV9jb3Vu
dCBpbiB2aG9zdF9zZXRfdnJpbmdfbnVtX2FkZHIoKQo+ID4gPiA+ID4gPiA+ICAgICAgdmhvc3Q6
IG1hcmsgZGlydHkgcGFnZXMgZHVyaW5nIG1hcCB1bmluaXQKPiA+ID4gPiA+ID4gPiAgICAgIHZo
b3N0OiBkb24ndCBkbyBzeW5jaHJvbml6ZV9yY3UoKSBpbiB2aG9zdF91bmluaXRfdnFfbWFwcygp
Cj4gPiA+ID4gPiA+ID4gICAgICB2aG9zdDogZG8gbm90IHVzZSBSQ1UgdG8gc3luY2hyb25pemUg
TU1VIG5vdGlmaWVyIHdpdGggd29ya2VyCj4gPiA+ID4gPiA+ID4gICAgICB2aG9zdDogY29ycmVj
dGx5IHNldCBkaXJ0eSBwYWdlcyBpbiBNTVUgbm90aWZpZXJzIGNhbGxiYWNrCj4gPiA+ID4gPiA+
ID4gICAgICB2aG9zdDogZG8gbm90IHJldHVybiAtRUFHQUlOIGZvciBub24gYmxvY2tpbmcgaW52
YWxpZGF0aW9uIHRvbyBlYXJseQo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICBkcml2
ZXJzL3Zob3N0L3Zob3N0LmMgfCAyMDIgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tCj4gPiA+ID4gPiA+ID4gICAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCB8ICAgNiAr
LQo+ID4gPiA+ID4gPiA+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspLCA4
NiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gVGhpcyBnZW5lcmFsbHkgbG9va3MgbW9yZSBzb2xp
ZC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEJ1dCB0aGlzIGFtb3VudHMgdG8gYSBzaWduaWZp
Y2FudCBvdmVyaGF1bCBvZiB0aGUgY29kZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEF0IHRo
aXMgcG9pbnQgaG93IGFib3V0IHdlIHJldmVydCA3ZjQ2NjAzMmRjOWU1YTYxMjE3ZjIyZWEzNGIy
ZGY5MzI3ODZiYmZjCj4gPiA+ID4gPiA+IGZvciB0aGlzIHJlbGVhc2UsIGFuZCB0aGVuIHJlLWFw
cGx5IGEgY29ycmVjdGVkIHZlcnNpb24KPiA+ID4gPiA+ID4gZm9yIHRoZSBuZXh0IG9uZT8KPiA+
ID4gPiA+IElmIHBvc3NpYmxlLCBjb25zaWRlciB3ZSd2ZSBhY3R1YWxseSBkaXNhYmxlZCB0aGUg
ZmVhdHVyZS4gSG93IGFib3V0IGp1c3QKPiA+ID4gPiA+IHF1ZXVlZCB0aG9zZSBwYXRjaGVzIGZv
ciBuZXh0IHJlbGVhc2U/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+IFNvcnJ5
IGlmIEkgd2FzIHVuY2xlYXIuIE15IGlkZWEgaXMgdGhhdAo+ID4gPiA+IDEuIEkgcmV2ZXJ0IHRo
ZSBkaXNhYmxlZCBjb2RlCj4gPiA+ID4gMi4gWW91IHNlbmQgYSBwYXRjaCByZWFkZGluZyBpdCB3
aXRoIGFsbCB0aGUgZml4ZXMgc3F1YXNoZWQKPiA+ID4gPiAzLiBNYXliZSBvcHRpbWl6YXRpb25z
IG9uIHRvcCByaWdodCBhd2F5Pwo+ID4gPiA+IDQuIFdlIHF1ZXVlICp0aGF0KiBmb3IgbmV4dCBh
bmQgc2VlIHdoYXQgaGFwcGVucy4KPiA+ID4gPiAKPiA+ID4gPiBBbmQgdGhlIGFkdmFudGFnZSBv
dmVyIHRoZSBwYXRjaHkgYXBwcm9hY2ggaXMgdGhhdCB0aGUgY3VycmVudCBwYXRjaGVzCj4gPiA+
ID4gYXJlIGhhcmQgdG8gcmV2aWV3LiBFLmcuICBpdCdzIG5vdCByZWFzb25hYmxlIHRvIGFzayBS
Q1UgZ3V5cyB0byByZXZpZXcKPiA+ID4gPiB0aGUgd2hvbGUgb2Ygdmhvc3QgZm9yIFJDVSB1c2Fn
ZSBidXQgaXQncyBtdWNoIG1vcmUgcmVhc29uYWJsZSB0byBhc2sKPiA+ID4gPiBhYm91dCBhIHNw
ZWNpZmljIHBhdGNoLgo+ID4gPiAKPiA+ID4gT2suIFRoZW4gSSBhZ3JlZSB0byByZXZlcnQuCj4g
PiA+IAo+ID4gPiBUaGFua3MKPiA+IEdyZWF0LCBzbyBwbGVhc2Ugc2VuZCB0aGUgZm9sbG93aW5n
Ogo+ID4gLSByZXZlcnQKPiA+IC0gc3F1YXNoZWQgYW5kIGZpeGVkIHBhdGNoCj4gCj4gCj4gSnVz
dCB0byBjb25maXJtLCBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIGEgc2luZ2xlIHNlcmllcyBvciB0
d28/Cj4gCj4gVGhhbmtzCj4gCgpPbmUgaXMgZmluZS4KCi0tIApNU1QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
