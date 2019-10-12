Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B0D523A
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 21:36:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 994FC1F4B;
	Sat, 12 Oct 2019 19:36:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F43D1F43
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:26:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A62205D3
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:26:16 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECB35C049E36
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 19:26:15 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id p8so1954511wrj.8
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 12:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=NER+WYNjIiTuYyELfX6XGxRMHyIeb8bjpkbmjz8T8Lw=;
	b=MVYXmoMakhbRpFqQubpeR86DJa8YaCe2kqzV1SK7YQsrnxJMCrDwByOV2Kp4fPC0yx
	UIAUhdBZssPIgQ4BnzhesxqYcZR5taJZPl7Dn1lvkER1+XgpxZ5BKEIgCbbWys1cMUT5
	M6l5Uw4ZU/xP1Rek71fgXHO7tPQVIQjX6D5Dwir/Rs8g/a5pt9WxTjxetCnOngKefo/U
	enm4TE4TMfoqSk5t3+PhtzsR1zyduQaJ3EQguvP/Ie4eVaBF7XgfD+EgQU1NJI4TML5Y
	C7l+M4RKUhuN6BK88fp4PVMLtOrBsxwizlwmNYPnptNUnIw0qjIHsmpH1BPXfLpScddU
	VJTg==
X-Gm-Message-State: APjAAAVxvmou5tWtBy3gZgyX64xBsyZJLg0CByxavyTTow9l2JURYU45
	of59YBZ6L8zOptHKjKpRAIz8lXokp1CzkM0fPsz2b5QIij5k6aNSom5Sj9IZH2o5KYvMmXI3W3B
	BDqtWfFYEqia4uAtB2K0cvL1Zr06yGNkw6uJGVKVWRA==
X-Received: by 2002:adf:e90d:: with SMTP id f13mr18704547wrm.104.1570908374722;
	Sat, 12 Oct 2019 12:26:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzVc4L36wZsuw/yIheWC3DcZ/4dWluqHH2rLuU6KbnjXtc/R53950cBJ1bTedee2IPkXIj5Q==
X-Received: by 2002:adf:e90d:: with SMTP id f13mr18704533wrm.104.1570908374478;
	Sat, 12 Oct 2019 12:26:14 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	r6sm14770346wmh.38.2019.10.12.12.26.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 12:26:13 -0700 (PDT)
Date: Sat, 12 Oct 2019 15:26:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v1 0/2] vhost: ring format independence
Message-ID: <20191012152332-mutt-send-email-mst@kernel.org>
References: <20191011134358.16912-1-mst@redhat.com>
	<f650ac1a-6e2a-9215-6e4f-a1095f4a89cd@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f650ac1a-6e2a-9215-6e4f-a1095f4a89cd@redhat.com>
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

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgMDQ6MTU6NDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzEwLzExIOS4i+WNiDk6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+IFNvIHRoZSBpZGVhIGlzIGFzIGZvbGxvd3M6IHdlIGNvbnZlcnQgZGVzY3JpcHRvcnMg
dG8gYW4KPiA+IGluZGVwZW5kZW50IGZvcm1hdCBmaXJzdCwgYW5kIHByb2Nlc3MgdGhhdCBjb252
ZXJ0aW5nIHRvCj4gPiBpb3YgbGF0ZXIuCj4gPiAKPiA+IFRoZSBwb2ludCBpcyB0aGF0IHdlIGhh
dmUgYSB0aWdodCBsb29wIHRoYXQgZmV0Y2hlcwo+ID4gZGVzY3JpcHRvcnMsIHdoaWNoIGlzIGdv
b2QgZm9yIGNhY2hlIHV0aWxpemF0aW9uLgo+ID4gVGhpcyB3aWxsIGFsc28gYWxsb3cgYWxsIGtp
bmQgb2YgYmF0Y2hpbmcgdHJpY2tzIC0KPiA+IGUuZy4gaXQgc2VlbXMgcG9zc2libGUgdG8ga2Vl
cCBTTUFQIGRpc2FibGVkIHdoaWxlCj4gPiB3ZSBhcmUgZmV0Y2hpbmcgbXVsdGlwbGUgZGVzY3Jp
cHRvcnMuCj4gCj4gCj4gSSB3b25kZXIgdGhpcyBtYXkgaGVscCBmb3IgcGVyZm9ybWFuY2U6CgpD
b3VsZCB5b3UgdHJ5IGl0IG91dCBhbmQgcmVwb3J0IHBsZWFzZT8KV291bGQgYmUgdmVyeSBtdWNo
IGFwcHJlY2lhdGVkLgoKPiAtIGFub3RoZXIgaW5kaXJlY3Rpb24gbGF5ZXIsIGluY3JlYXNlZCBm
b290cHJpbnQKClNlZW1zIHRvIGJlIG9mZnNldCBvZmYgYnkgaW1wcm92ZWQgYmF0Y2hpbmcuCkZv
ciBzdXJlIHdpbGwgYmUgZXZlbiBiZXR0ZXIgaWYgd2UgY2FuIG1vdmUgc3RhYy9jbGFjIG91dCwK
b3IgcmVwbGFjZSBzb21lIGdldC9wdXQgdXNlciB3aXRoIGJpZ2dlciBjb3B5IHRvL2Zyb20uCgo+
IC0gd29uJ3QgaGVscCBvciBldmVuIGRlZ3JhZGUgd2hlbiB0aGVyZSdzIG5vIGJhdGNoCgpJIGNv
dWxkbid0IG1lYXN1cmUgYSBkaWZmZXJlbmNlLiBJJ20gZ3Vlc3NpbmcKCj4gLSBhbiBleHRyYSBv
dmVyaGVhZCBpbiB0aGUgY2FzZSBvZiBpbiBvcmRlciB3aGVyZSB3ZSBzaG91bGQgYWxyZWFkeSBo
YWQKPiB0aWdodCBsb29wCgppdCdzIG5vdCBzbyB0aWdodCB3aXRoIHRyYW5zbGF0aW9uIGluIHRo
ZXJlLgp0aGlzIGV4YWN0bHkgbWFrZXMgdGhlIGxvb3AgdGlnaHQuCgo+IC0gbmVlZCBjYXJlZnVs
bHkgZGVhbCB3aXRoIGluZGlyZWN0IGFuZCBjaGFpbiBvciBtYWtlIGl0IG9ubHkgd29yayBmb3IK
PiBwYWNrZXQgc2l0IGp1c3QgaW4gYSBzaW5nbGUgZGVzY3JpcHRvcgo+IAo+IFRoYW5rcwoKSSBk
b24ndCB1bmRlcnN0YW5kIHRoaXMgbGFzdCBjb21tZW50LgoKPiAKPiA+IAo+ID4gQW5kIHBlcmhh
cHMgbW9yZSBpbXBvcnRhbnRseSwgdGhpcyBpcyBhIHZlcnkgZ29vZCBmaXQgZm9yIHRoZSBwYWNr
ZWQKPiA+IHJpbmcgbGF5b3V0LCB3aGVyZSB3ZSBnZXQgYW5kIHB1dCBkZXNjcmlwdG9ycyBpbiBv
cmRlci4KPiA+IAo+ID4gVGhpcyBwYXRjaHNldCBzZWVtcyB0byBhbHJlYWR5IHBlcmZvcm0gZXhh
Y3RseSB0aGUgc2FtZSBhcyB0aGUgb3JpZ2luYWwKPiA+IGNvZGUgYWxyZWFkeSBiYXNlZCBvbiBh
IG1pY3JvYmVuY2htYXJrLiAgTW9yZSB0ZXN0aW5nIHdvdWxkIGJlIHZlcnkgbXVjaAo+ID4gYXBw
cmVjaWF0ZWQuCj4gPiAKPiA+IEJpZ2dlc3QgVE9ETyBiZWZvcmUgdGhpcyBmaXJzdCBzdGVwIGlz
IHJlYWR5IHRvIGdvIGluIGlzIHRvCj4gPiBiYXRjaCBpbmRpcmVjdCBkZXNjcmlwdG9ycyBhcyB3
ZWxsLgo+ID4gCj4gPiBJbnRlZ3JhdGluZyBpbnRvIHZob3N0LW5ldCBpcyBiYXNpY2FsbHkKPiA+
IHMvdmhvc3RfZ2V0X3ZxX2Rlc2Mvdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2gvIC0KPiA+IG9yIGFk
ZCBhIG1vZHVsZSBwYXJhbWV0ZXIgbGlrZSBJIGRpZCBpbiB0aGUgdGVzdCBtb2R1bGUuCj4gPiAK
PiA+IAo+ID4gCj4gPiBNaWNoYWVsIFMuIFRzaXJraW4gKDIpOgo+ID4gICAgdmhvc3Q6IG9wdGlv
biB0byBmZXRjaCBkZXNjcmlwdG9ycyB0aHJvdWdoIGFuIGluZGVwZW5kZW50IHN0cnVjdAo+ID4g
ICAgdmhvc3Q6IGJhdGNoaW5nIGZldGNoZXMKPiA+IAo+ID4gICBkcml2ZXJzL3Zob3N0L3Rlc3Qu
YyAgfCAgMTkgKystCj4gPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyB8IDMzMyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAgZHJpdmVycy92aG9zdC92aG9z
dC5oIHwgIDIwICsrLQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDM2NSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
