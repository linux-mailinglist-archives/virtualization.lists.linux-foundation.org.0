Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AEB89A61
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 11:49:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CD0D6C84;
	Mon, 12 Aug 2019 09:49:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7F6A7C79
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 09:49:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 02F3987B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 09:49:14 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m10so1275460qkk.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 02:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=TeG3wutKuFLwVY8GXTa6M+xMk4IsoY0IuBgfuWlKI8w=;
	b=qQx0ce/WQSo8axr/x2ktkX79GlLRsnGpYIt746Fqu1Fn8rlE8Yn5L3D49Q7RvaBdzJ
	z/EXkgt0NVsLyISInmDlVW9dw8o/lhiboxeGo2YS6w1fLPON3Comzfcz5LcN7T2WfGrN
	CD5gihL3To1/xwiXjEvbOvrKDufsg73wMi9lNkks6dQcFHQyUn147wLxqF19i0TmPxX0
	Qh25cI4YT3ZQYvRHHbAmBXFQWpAvt/wm+5MA1sKVKvpTwxaefHMjWOqDPbktdp+WjB7v
	3MULxS7QtdvbrhgddmOBE7HeIhZIwXwIRupY4n/hYXBvvpGpS1FVuZHZNcUejaJt85H/
	+R6Q==
X-Gm-Message-State: APjAAAXty6uaVM7aRU8TBYv5BTCWfxjwkc/xywviQpzzpiSP8kTdPVUP
	eQDCwEBGGpe0Oqch9ghgI2GPrQ==
X-Google-Smtp-Source: APXvYqxP0GkCXonLtypbly8kLbgJ4TN28n5gWEUnHayGxRExqWLocZL6kaOvmE9QUvNpukx30J3PxA==
X-Received: by 2002:a37:79c7:: with SMTP id u190mr3917170qkc.26.1565603354162; 
	Mon, 12 Aug 2019 02:49:14 -0700 (PDT)
Received: from redhat.com ([147.234.38.29]) by smtp.gmail.com with ESMTPSA id
	m27sm52517604qtu.31.2019.08.12.02.49.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 02:49:13 -0700 (PDT)
Date: Mon, 12 Aug 2019 05:49:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190812054429-mutt-send-email-mst@kernel.org>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6NDQ6NTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMTEg5LiK5Y2IMTo1MiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDE6NDg6NDJBTSAtMDQwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gSGkgYWxsOgo+ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMgdHJ5IHRvIGZp
eCBzZXZlcmFsIGlzc3VlcyBpbnRyb2R1Y2VkIGJ5IG1ldGEgZGF0YQo+ID4gPiBhY2NlbHJlYXRp
b24gc2VyaWVzLiBQbGVhc2UgcmV2aWV3Lgo+ID4gPiAKPiA+ID4gQ2hhbmdlcyBmcm9tIFY0Ogo+
ID4gPiAtIHN3aXRjaCB0byB1c2Ugc3BpbmxvY2sgc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdp
dGggYWNjZXNzb3JzCj4gPiA+IAo+ID4gPiBDaGFuZ2VzIGZyb20gVjM6Cj4gPiA+IC0gcmVtb3Zl
IHRoZSB1bm5lY2Vzc2FyeSBwYXRjaAo+ID4gPiAKPiA+ID4gQ2hhbmdlcyBmcm9tIFYyOgo+ID4g
PiAtIHVzZSBzZXFsY2sgaGVscGVyIHRvIHN5bmNocm9uaXplIE1NVSBub3RpZmllciB3aXRoIHZo
b3N0IHdvcmtlcgo+ID4gPiAKPiA+ID4gQ2hhbmdlcyBmcm9tIFYxOgo+ID4gPiAtIHRyeSBub3Qg
dXNlIFJDVSB0byBzeW5jcmhvbml6ZSBNTVUgbm90aWZpZXIgd2l0aCB2aG9zdCB3b3JrZXIKPiA+
ID4gLSBzZXQgZGlydHkgcGFnZXMgYWZ0ZXIgbm8gcmVhZGVycwo+ID4gPiAtIHJldHVybiAtRUFH
QUlOIG9ubHkgd2hlbiB3ZSBmaW5kIHRoZSByYW5nZSBpcyBvdmVybGFwcGVkIHdpdGgKPiA+ID4g
ICAgbWV0YWRhdGEKPiA+ID4gCj4gPiA+IEphc29uIFdhbmcgKDkpOgo+ID4gPiAgICB2aG9zdDog
ZG9uJ3Qgc2V0IHVhZGRyIGZvciBpbnZhbGlkIGFkZHJlc3MKPiA+ID4gICAgdmhvc3Q6IHZhbGlk
YXRlIE1NVSBub3RpZmllciByZWdpc3RyYXRpb24KPiA+ID4gICAgdmhvc3Q6IGZpeCB2aG9zdCBt
YXAgbGVhawo+ID4gPiAgICB2aG9zdDogcmVzZXQgaW52YWxpZGF0ZV9jb3VudCBpbiB2aG9zdF9z
ZXRfdnJpbmdfbnVtX2FkZHIoKQo+ID4gPiAgICB2aG9zdDogbWFyayBkaXJ0eSBwYWdlcyBkdXJp
bmcgbWFwIHVuaW5pdAo+ID4gPiAgICB2aG9zdDogZG9uJ3QgZG8gc3luY2hyb25pemVfcmN1KCkg
aW4gdmhvc3RfdW5pbml0X3ZxX21hcHMoKQo+ID4gPiAgICB2aG9zdDogZG8gbm90IHVzZSBSQ1Ug
dG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggd29ya2VyCj4gPiA+ICAgIHZob3N0OiBj
b3JyZWN0bHkgc2V0IGRpcnR5IHBhZ2VzIGluIE1NVSBub3RpZmllcnMgY2FsbGJhY2sKPiA+ID4g
ICAgdmhvc3Q6IGRvIG5vdCByZXR1cm4gLUVBR0FJTiBmb3Igbm9uIGJsb2NraW5nIGludmFsaWRh
dGlvbiB0b28gZWFybHkKPiA+ID4gCj4gPiA+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMjAy
ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAgIGRyaXZl
cnMvdmhvc3Qvdmhvc3QuaCB8ICAgNiArLQo+ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIyIGlu
c2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQo+ID4gVGhpcyBnZW5lcmFsbHkgbG9va3MgbW9y
ZSBzb2xpZC4KPiA+IAo+ID4gQnV0IHRoaXMgYW1vdW50cyB0byBhIHNpZ25pZmljYW50IG92ZXJo
YXVsIG9mIHRoZSBjb2RlLgo+ID4gCj4gPiBBdCB0aGlzIHBvaW50IGhvdyBhYm91dCB3ZSByZXZl
cnQgN2Y0NjYwMzJkYzllNWE2MTIxN2YyMmVhMzRiMmRmOTMyNzg2YmJmYwo+ID4gZm9yIHRoaXMg
cmVsZWFzZSwgYW5kIHRoZW4gcmUtYXBwbHkgYSBjb3JyZWN0ZWQgdmVyc2lvbgo+ID4gZm9yIHRo
ZSBuZXh0IG9uZT8KPiAKPiAKPiBJZiBwb3NzaWJsZSwgY29uc2lkZXIgd2UndmUgYWN0dWFsbHkg
ZGlzYWJsZWQgdGhlIGZlYXR1cmUuIEhvdyBhYm91dCBqdXN0Cj4gcXVldWVkIHRob3NlIHBhdGNo
ZXMgZm9yIG5leHQgcmVsZWFzZT8KPiAKPiBUaGFua3MKClNvcnJ5IGlmIEkgd2FzIHVuY2xlYXIu
IE15IGlkZWEgaXMgdGhhdAoxLiBJIHJldmVydCB0aGUgZGlzYWJsZWQgY29kZQoyLiBZb3Ugc2Vu
ZCBhIHBhdGNoIHJlYWRkaW5nIGl0IHdpdGggYWxsIHRoZSBmaXhlcyBzcXVhc2hlZAozLiBNYXli
ZSBvcHRpbWl6YXRpb25zIG9uIHRvcCByaWdodCBhd2F5Pwo0LiBXZSBxdWV1ZSAqdGhhdCogZm9y
IG5leHQgYW5kIHNlZSB3aGF0IGhhcHBlbnMuCgpBbmQgdGhlIGFkdmFudGFnZSBvdmVyIHRoZSBw
YXRjaHkgYXBwcm9hY2ggaXMgdGhhdCB0aGUgY3VycmVudCBwYXRjaGVzCmFyZSBoYXJkIHRvIHJl
dmlldy4gRS5nLiAgaXQncyBub3QgcmVhc29uYWJsZSB0byBhc2sgUkNVIGd1eXMgdG8gcmV2aWV3
CnRoZSB3aG9sZSBvZiB2aG9zdCBmb3IgUkNVIHVzYWdlIGJ1dCBpdCdzIG11Y2ggbW9yZSByZWFz
b25hYmxlIHRvIGFzawphYm91dCBhIHNwZWNpZmljIHBhdGNoLgoKCi0tIApNU1QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
