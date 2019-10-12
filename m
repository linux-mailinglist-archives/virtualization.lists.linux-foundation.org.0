Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B2D5281
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 22:49:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 10F5B2116;
	Sat, 12 Oct 2019 20:49:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3F0D52101
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 20:37:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D67E8D0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 20:37:01 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FCCCC05AA63
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 20:37:01 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id l3so5454611wmf.8
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 13:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=nsuG9DynP4h5A9hJiRAHv7ZghRiHq0bUTGCGrIQlgl4=;
	b=DZLgBvyyoqdmu0Ri0yU9KSbcf/w9+2BDOYjQDoqv0WrGaeZ7Ew68Zn/EdqOMr5jfH5
	DVt9jUPfk+6a5RRcWCeJe3GXDeQG/WAxSwwZsvkGyoFqrgpiDN3VLEo7rDKUlKOMu29R
	8rIqlmRmnYtAt/ajjXHjsVwMPcBM+s6/M35MrwX7tymVdsIq4CvEqU0njhJIBa+DoGAZ
	2o9vzB9xrZ4eVN7unTkENU21KN2qWgIheQAyTMYKRuZnTV6QFgiWbq/1vK5/ZUgCJfdj
	BFi0j9gLsEt/ZJdF+UhjybIWsxVy0/aAAh21I4tXcD1CaM7HYMvFd9qRq09Q/J9K5m7C
	/XRw==
X-Gm-Message-State: APjAAAX3LE3DQNtvqA1O9Vw0WcZefs0lmz8ST0JjMVV7WdKclhH2JQjM
	sqnEKmtdd2GgeoNoqgCCU7rtyQQvcGHNTqp9TqULqEvGQZEoaiqg79DC9SMoJcd6xpEcLFa+0F7
	HJnes4AQdVSX02GOFpl8ldOcYWukWdA4rVWqQ6BqLMg==
X-Received: by 2002:a5d:6709:: with SMTP id o9mr18541563wru.116.1570912620055; 
	Sat, 12 Oct 2019 13:37:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8AwCsOKbqErxze+dj/LkUtWRGrZpyJTxNw8vodxFVLNH1FPTXAO2PjutYGomFF101n5ZJLw==
X-Received: by 2002:a5d:6709:: with SMTP id o9mr18541555wru.116.1570912619857; 
	Sat, 12 Oct 2019 13:36:59 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	d78sm17957635wmd.47.2019.10.12.13.36.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 13:36:59 -0700 (PDT)
Date: Sat, 12 Oct 2019 16:36:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v1 0/2] vhost: ring format independence
Message-ID: <20191012163635-mutt-send-email-mst@kernel.org>
References: <20191011134358.16912-1-mst@redhat.com>
	<b24b3c9e-3a5d-fa5e-8218-ea7def0e5a39@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b24b3c9e-3a5d-fa5e-8218-ea7def0e5a39@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgMDM6MzE6NTBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzEwLzExIOS4i+WNiDk6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+IFNvIHRoZSBpZGVhIGlzIGFzIGZvbGxvd3M6IHdlIGNvbnZlcnQgZGVzY3JpcHRvcnMg
dG8gYW4KPiA+IGluZGVwZW5kZW50IGZvcm1hdCBmaXJzdCwgYW5kIHByb2Nlc3MgdGhhdCBjb252
ZXJ0aW5nIHRvCj4gPiBpb3YgbGF0ZXIuCj4gPiAKPiA+IFRoZSBwb2ludCBpcyB0aGF0IHdlIGhh
dmUgYSB0aWdodCBsb29wIHRoYXQgZmV0Y2hlcwo+ID4gZGVzY3JpcHRvcnMsIHdoaWNoIGlzIGdv
b2QgZm9yIGNhY2hlIHV0aWxpemF0aW9uLgo+ID4gVGhpcyB3aWxsIGFsc28gYWxsb3cgYWxsIGtp
bmQgb2YgYmF0Y2hpbmcgdHJpY2tzIC0KPiA+IGUuZy4gaXQgc2VlbXMgcG9zc2libGUgdG8ga2Vl
cCBTTUFQIGRpc2FibGVkIHdoaWxlCj4gPiB3ZSBhcmUgZmV0Y2hpbmcgbXVsdGlwbGUgZGVzY3Jp
cHRvcnMuCj4gPiAKPiA+IEFuZCBwZXJoYXBzIG1vcmUgaW1wb3J0YW50bHksIHRoaXMgaXMgYSB2
ZXJ5IGdvb2QgZml0IGZvciB0aGUgcGFja2VkCj4gPiByaW5nIGxheW91dCwgd2hlcmUgd2UgZ2V0
IGFuZCBwdXQgZGVzY3JpcHRvcnMgaW4gb3JkZXIuCj4gPiAKPiA+IFRoaXMgcGF0Y2hzZXQgc2Vl
bXMgdG8gYWxyZWFkeSBwZXJmb3JtIGV4YWN0bHkgdGhlIHNhbWUgYXMgdGhlIG9yaWdpbmFsCj4g
PiBjb2RlIGFscmVhZHkgYmFzZWQgb24gYSBtaWNyb2JlbmNobWFyay4gIE1vcmUgdGVzdGluZyB3
b3VsZCBiZSB2ZXJ5IG11Y2gKPiA+IGFwcHJlY2lhdGVkLgo+ID4gCj4gPiBCaWdnZXN0IFRPRE8g
YmVmb3JlIHRoaXMgZmlyc3Qgc3RlcCBpcyByZWFkeSB0byBnbyBpbiBpcyB0bwo+ID4gYmF0Y2gg
aW5kaXJlY3QgZGVzY3JpcHRvcnMgYXMgd2VsbC4KPiA+IAo+ID4gSW50ZWdyYXRpbmcgaW50byB2
aG9zdC1uZXQgaXMgYmFzaWNhbGx5Cj4gPiBzL3Zob3N0X2dldF92cV9kZXNjL3Zob3N0X2dldF92
cV9kZXNjX2JhdGNoLyAtCj4gPiBvciBhZGQgYSBtb2R1bGUgcGFyYW1ldGVyIGxpa2UgSSBkaWQg
aW4gdGhlIHRlc3QgbW9kdWxlLgo+IAo+IAo+IEl0IHdvdWxkIGJlIGJldHRlciB0byBjb252ZXJ0
IHZob3N0X25ldCB0aGVuIEkgY2FuIGRvIHNvbWUgYmVuY2htYXJrIG9uCj4gdGhhdC4KPiAKPiBU
aGFua3MKClN1cmUsIEkgcG9zdCBhIHNtYWxsIHBhdGNoIHRoYXQgZG9lcyB0aGlzLgoKPiAKPiA+
IAo+ID4gCj4gPiAKPiA+IE1pY2hhZWwgUy4gVHNpcmtpbiAoMik6Cj4gPiAgICB2aG9zdDogb3B0
aW9uIHRvIGZldGNoIGRlc2NyaXB0b3JzIHRocm91Z2ggYW4gaW5kZXBlbmRlbnQgc3RydWN0Cj4g
PiAgICB2aG9zdDogYmF0Y2hpbmcgZmV0Y2hlcwo+ID4gCj4gPiAgIGRyaXZlcnMvdmhvc3QvdGVz
dC5jICB8ICAxOSArKy0KPiA+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMzMzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gICBkcml2ZXJzL3Zob3N0L3Zo
b3N0LmggfCAgMjAgKystCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzY1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
