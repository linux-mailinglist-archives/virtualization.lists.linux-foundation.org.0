Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122B35D299
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 23:30:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB77D404D9;
	Mon, 12 Apr 2021 21:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qUU8fYeKlBw0; Mon, 12 Apr 2021 21:30:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22C27404DB;
	Mon, 12 Apr 2021 21:30:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF3A4C000A;
	Mon, 12 Apr 2021 21:30:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28402C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 21:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 167234058B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 21:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtLZIW6s9PgB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 21:29:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E771C4054A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618262996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLCGQXyZ/06iMZZSBbUM87JOLvHw1MhSZQ4NsQaZGK4=;
 b=TCMOof96SEmvfcLJ02fd3cv9NbFmg5gxJHrCYIfvtEqU937KPsdLeR1qQyWCs8cm5C2/Zw
 xsXIrRKmm9fVcddsQlGm4Bq1OdhFvww5AnkMw4HQi07bX1b5YofokKrh+B9X7NThlltmDw
 Ou9WrcwHYTgNIXY7R2EqMOmuMKezPJk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-SWXr45LoOIOwLMBh4CFqUA-1; Mon, 12 Apr 2021 17:29:55 -0400
X-MC-Unique: SWXr45LoOIOwLMBh4CFqUA-1
Received: by mail-wr1-f69.google.com with SMTP id e9so6552554wrg.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 14:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XLCGQXyZ/06iMZZSBbUM87JOLvHw1MhSZQ4NsQaZGK4=;
 b=JI43QOvlSdcQLF4NwsIgSIk0hrSUIUKO79fjDGHT2QzhG62aYgScvDf8KoALJRBme7
 AUY5apIL32wsCzbotTGM2qfL2fIYK2JA/5UIncMFKj5W2/MIr8c7x23lRcwvikB8USY7
 U3XiI6nMtRad0bCPSzuDUU5EdkouEw2qBzsEmV0HCw4XHGUtc54on/TDkN2SSGVnZgyy
 kJsD4qS8uGmJM13ZY0v/Yf6B6WeX5GbJZExIRnhRQ4xF+ZGqbof+bnOViM1fUW+i0NIc
 pcKqEBO56EoHMBdYQ7lrDjp6lGrPtfJqfFiK9phskgYdREHE1QdiRGg61QRNLJHrW39r
 Iy/w==
X-Gm-Message-State: AOAM532ohSjUaArkVqblA/Aw0nbVB9wRL0T5lerlEjOqcliuNiLW5r3p
 WWIf8E+dWBJOz9mdr+96zrRU1AAA9Dc5ZUEaQGtkksQQGqWgYL0viV517SopSGzXQyZklqxpOrn
 ho1jsunjdZg5xqccoZZ5K6tbqbwUlA1VAziglDA6IFg==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr33469610wrw.3.1618262993800;
 Mon, 12 Apr 2021 14:29:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRAWDS3bD2gxeZPKEZGwGLDMw38oIleK8NNrlyrg6fccKdk20D7FRXnWJpEyIVNrHyTgLPBQ==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr33469594wrw.3.1618262993518;
 Mon, 12 Apr 2021 14:29:53 -0700 (PDT)
Received: from redhat.com ([2a10:8006:2281:0:1994:c627:9eac:1825])
 by smtp.gmail.com with ESMTPSA id 200sm537325wmb.1.2021.04.12.14.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 14:29:52 -0700 (PDT)
Date: Mon, 12 Apr 2021 17:29:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH v2 1/3] virtio: update reset callback to return status
Message-ID: <20210412172333-mutt-send-email-mst@kernel.org>
References: <20210408081109.56537-1-mgurtovoy@nvidia.com>
 <16fa0e31-a305-3b41-b0d3-ad76aa00177b@redhat.com>
 <1f134102-4ccb-57e3-858d-3922d851ce8a@nvidia.com>
 <a46cef9b-b8da-b748-c332-a3a05bd9135f@redhat.com>
 <103ae6fe-1ffc-90a3-09cd-bcbbcbb8eee7@nvidia.com>
 <7d4599c5-348e-5ca1-8eb6-577d65dc4688@redhat.com>
 <96742dde-edba-0329-c9c2-b3ac3b28cf1d@nvidia.com>
 <20210412050311-mutt-send-email-mst@kernel.org>
 <e1e4a42c-2e87-adc1-9089-1c722f02b810@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e1e4a42c-2e87-adc1-9089-1c722f02b810@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, cohuck@redhat.com,
 virtualization@lists.linux-foundation.org, nitzanc@nvidia.com, oren@nvidia.com
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

T24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgMDM6MTc6MDJQTSArMDMwMCwgTWF4IEd1cnRvdm95IHdy
b3RlOgo+IAo+IE9uIDQvMTIvMjAyMSAxMjowNyBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gU3VuLCBBcHIgMTEsIDIwMjEgYXQgMTI6NTA6MjJQTSArMDMwMCwgTWF4IEd1cnRv
dm95IHdyb3RlOgo+ID4gPiBPbiA0LzkvMjAyMSA4OjIyIEFNLCBKYXNvbiBXYW5nIHdyb3RlOgo+
ID4gPiA+IOWcqCAyMDIxLzQvOCDkuIvljYgxMDoyNCwgTWF4IEd1cnRvdm95IOWGmemBkzoKPiA+
ID4gPiA+IE9uIDQvOC8yMDIxIDQ6MTQgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+
IOWcqCAyMDIxLzQvOCDkuIvljYg1OjU2LCBNYXggR3VydG92b3kg5YaZ6YGTOgo+ID4gPiA+ID4g
PiA+IE9uIDQvOC8yMDIxIDExOjU4IEFNLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiA+
ID4g5ZyoIDIwMjEvNC84IOS4i+WNiDQ6MTEsIE1heCBHdXJ0b3ZveSDlhpnpgZM6Cj4gPiA+ID4g
PiA+ID4gPiA+IFRoZSByZXNldCBkZXZpY2Ugb3BlcmF0aW9uLCB1c3VhbGx5IGlzIGFuIG9wZXJh
dGlvbgo+ID4gPiA+ID4gPiA+ID4gPiB0aGF0IG1pZ2h0IGZhaWwgZnJvbQo+ID4gPiA+ID4gPiA+
ID4gPiB2YXJpb3VzIHJlYXNvbnMuIEZvciBleGFtcGxlLCB0aGUgY29udHJvbGxlciBtaWdodAo+
ID4gPiA+ID4gPiA+ID4gPiBiZSBpbiBhIGJhZCBzdGF0ZSBhbmQKPiA+ID4gPiA+ID4gPiA+ID4g
Y2FuJ3QgYW5zd2VyIHRvIGFueSByZXF1ZXN0LiBVc3VhbGx5LCB0aGUgcGFyYXZpcnQgU1cgYmFz
ZWQgdmlydGlvCj4gPiA+ID4gPiA+ID4gPiA+IGRldmljZXMgYWx3YXlzIHN1Y2NlZWQgaW4gcmVz
ZXQgb3BlcmF0aW9uIGJ1dCB0aGlzCj4gPiA+ID4gPiA+ID4gPiA+IGlzIG5vdCB0aGUgY2FzZSBm
b3IKPiA+ID4gPiA+ID4gPiA+ID4gSFcgYmFzZWQgdmlydGlvIGRldmljZXMuCj4gPiA+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEkgd291bGQgbGlrZSB0byBrbm93IHVuZGVyIHdoYXQgY29u
ZGl0aW9uIHRoYXQgdGhlIHJlc2V0Cj4gPiA+ID4gPiA+ID4gPiBvcGVyYXRpb24gbWF5IGZhaWwg
KGV4Y2VwdCBmb3IgdGhlIGNhc2Ugb2YgYSBidWdnCj4gPiA+ID4gPiA+ID4gPiBndWVzdCkuCj4g
PiA+ID4gPiA+ID4gVGhlIGNvbnRyb2xsZXIgbWlnaHQgbm90IGJlIHJlYWR5IG9yIHN0dWNrLiBU
aGlzIGlzIGEgcmVhbAo+ID4gPiA+ID4gPiA+IHVzZSBjYXNlIGZvciBtYW55IFBDSSBkZXZpY2Vz
Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEZvciByZWFsIGRldmljZXMgdGhlIEZXIG1p
Z2h0IGJlIGluIGEgYmFkIHN0YXRlIGFuZCBpdCBjYW4KPiA+ID4gPiA+ID4gPiBoYXBwZW4gYWxz
byBmb3IgcGFyYXZpcnQgZGV2aWNlIGlmIHlvdSBoYXZlIGEgYnVnIGluIHRoZQo+ID4gPiA+ID4g
PiA+IGNvbnRyb2xsZXIgY29kZSBvciBpZiB5b3UgZW50ZXJlZCBzb21lIGVycm9yIGZsb3cgKE91
dCBvZgo+ID4gPiA+ID4gPiA+IG1lbW9yeSkuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
WW91IGRvbid0IHdhbnQgdG8gYmUgc3R1Y2sgYmVjYXVzZSBvZiBvbmUgYmFkIGRldmljZS4KPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFNvIHRoZSBidWdneSBkcml2ZXIgY2FuIGRhbWFnZSB0aGUg
aG9zdCB0aHJvdWdoIHZhcmlvdXMgd2F5cywKPiA+ID4gPiA+ID4gSSdtIG5vdCBzdXJlIGRvaW5n
IHN1Y2ggd29ya2Fyb3VuZCBpcyB3b3J0aHdoaWxlLgo+ID4gPiA+ID4gZG8geW91IG1lYW4gZGV2
aWNlID8KPiA+ID4gPiAKPiA+ID4gPiBZZXMuCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gPiBz
b21ldGltZXMgeW91IG5lZWQgdG8gcmVwbGFjZSBkZXZpY2UgRlcgYW5kIGl0IHdpbGwgd29yay4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBkb24ndCB0aGluayBpdCdzIGEgd29ya2Fyb3VuZC4gT3Ro
ZXIgcHJvdG9jb2xzLCBzdWNoIGFzIE5WTWUsCj4gPiA+ID4gPiBzb2x2ZWQgdGhpcyBpbiB0aGUg
c3BlY2lmaWNhdGlvbi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gUENJIGNvbmZpZyBzcGFjZSBhbmQg
UENJIGNvbnRyb2xsZXIgYXJlIHNvbWV0aW1lcyAyIGRpZmZlcmVudAo+ID4gPiA+ID4gY29tcG9u
ZW50cyBhbmQgc29tZXRpbWVzIHRoZSBjb250cm9sbGVyIGlzIG5vdCBhY3RpdmUsIGFsdGhvdWdo
IHRoZQo+ID4gPiA+ID4gZGV2aWNlIGlzIHBsdWdnZWQgYW5kIHNlZW4gYnkgdGhlIFBDSSBzdWJz
eXN0ZW0uCj4gPiA+ID4gCj4gPiA+ID4gU28gSSB0aGluayB3ZSBuZWVkIHBhdGNoIHRvIHNwZWMg
dG8gc2VlIGlmIGl0IHdvcmtzIGZpcnN0Lgo+ID4gPiBXZSBjYW4ndCBsZWF2ZSB0aGUgZHJpdmVy
IHRvIGxvb3AgZm9yZXZlciB3aXRob3V0IGFsbG93aW5nIG5leHQgImdvb2QiCj4gPiA+IHZpcnRp
byBkZXZpY2VzIHRvIHByb2JlLgo+ID4gPiAKPiA+ID4gV2UgY2FuIGluIHBhcmFsbGVsIGxvb2sg
Zm9yIHNwZWMgZml4ZXMgYnV0IGZvciBub3cgd2UgbXVzdCBmaXggdGhlIGRyaXZlci4KPiA+IEkn
ZCBsaWtlIHRvIG5hcnJvdyB0aGUgY2FzZSB0aG91Z2guIHRoZSBwcm9wZXIgdGhpbmcKPiA+IHdv
dWxkIHByb2JhYmx5IGJlIGZvciBkZXZpY2UgdG8gY2xlYXIgdGhlIHN0YXR1cy4KPiA+IFByb3Zp
ZGVkIGl0IGVudGVyZWQgc29tZSBzdGF0ZSB3aGVyZSBpdCBjYW4gbm90IGRvIGl0IC0KPiA+IGlz
IHRoZXJlIGFueXRoaW5nIHNwZWNpYWwgYWJvdXQKPiA+IHRoZSBkZXZpY2Ugc3RhdGUgdGhhdCAq
Y2FuKiBiZSBkZXRlY3RlZD8KPiA+IElmIHllcyB3aGF0IGlzIGl0Pwo+IAo+IFdlIGRvbid0IGhh
dmUgYW55dGhpbmcgaW4gdGhlIHNwZWMgdG8gZGV0ZWN0IGl0Lgo+IAo+IERpZmZlcmVudCBkZXZp
Y2VzIGNhbiBoYXZlIGRpZmZlcmVudCBiZWhhdmlvci4KCkkgbWVhbiAuLi4gaXMgdGhpcyB0cnlp
bmcgdG8gYWRkcmVzcyBhIHByYWN0aWNhbCBvciBhIHRoZW9yZXRpY2FsCnByb2JsZW0/Cgo+IFRo
ZSBvbmx5IHRoaW5nIHdlIGNhbiBjb3VudCBvbiBpcyB0aGF0IHRoZSBkZXZpY2UgZGlkbid0IHBy
ZXNlbnQgYSAwIGluCj4gZGV2aWNlX3N0YXR1cyBvbmNlIHRoYXQgd2FzIHJlcXVlc3RlZC4KClNv
IGZvciBleGFtcGxlLCBpdCdzIHF1aXRlIGVhc3kgZm9yIGEgaHlwZXJ2aXNvciB0byBwcmVzZW50
IDAgaWYgaXQKd2FudHMgdG8gZXZlbiBpZiBkZXZpY2UgaXNuJ3QgZnVsbHkgcmVzZXQgeWV0IC4u
LiB0aGUgZmFjdCBpdCBkb2Vzbid0CnNlZW1zIHRvIGluZGljYXRlIGl0IGRvZXMgbm90IHdhbnQg
dGhlIGRyaXZlciB0byBiZSBkZWxldGVkIHlldC4KSSBkb24ndCB5ZXQgdW5kZXJzdGFuZCB3aHkg
b3ZlcnJpZGluZyB0aGF0IGZyb20gZ3Vlc3QgaXMgYSBnb29kIGlkZWEuCldoYXQgZG9lcyBndWVz
dCBrbm93IHRoYXQgaHlwZXJ2aXNvciBkb2Vzbid0PwoKCj4gCj4gPiAKPiA+ID4gVGhlIGZpeCBj
YW4gYmUgdXNpbmcgdGhlIG1lY2hhbmlzbSBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzIG9yIGFk
ZGluZyBhbgo+ID4gPiBhc3luYyBwcm9iaW5nIG1lY2hhbmlzbS4KPiA+IFdoYXQgd291bGQgdGhh
dCBiZT8KPiAKPiBqdXN0IHNjaGVkdWxlIHNvbWUgd29yayB1c2luZyBxdWV1ZV93b3JrL3NjaGVk
dWxlX3dvcmsuCj4gCj4gQW5kIHdhaXQgZm9yIGl0IGluIHRoZSB2aXJ0aW9fcGNpX3JlbW92ZQo+
IAo+ID4gPiBJbiBib3RoIHNvbHV0aW9ucywgd2UgY2FuJ3QgYWxsb3cgbG9vcGluZyBmb3JldmVy
Lgo+ID4gTXVsdGlwbGUgbWludXRlIGRvd250aW1lIGlzbid0IG11Y2ggYmV0dGVyIGVpdGhlci4g
SSdkIGxpa2UgYQo+ID4gbXVjaCBzaG9ydGVyIHRpbWVyIG9yIGV2ZW4gbm8gdGltZXIgYXQgYWxs
LCBpbnN0ZWFkCj4gPiB2ZXJpZnlpbmcgdGhhdCBkZXZpY2UgaXMgYWxpdmUgZXZlcnkgWCBpdGVy
YXRpb25zLgo+IAo+IEkgYWRkZWQgYW4gb3B0aW9uIHRvIGNvbmZpZ3VyZSB0aGUgbW9kdWxlIHBh
cmFtZXRlci4KPiAKPiBJIHRoaW5rIDItMyBtaW51dGVzIHRvIHdhaXQgaXMgbm90IHNvIGJhZCBh
bmQgb25lIGNhbiBjb25maWd1cmUgaXQgZm9yIGFueQo+IHZhbHVlIHRoYXQgZml0cy4KCldoYXQg
bW90aXZhdGVzIGFsbCB0aGlzIHdvcmsgdGhvdWdoPyBGaWd1cmluZyBvdXQgdGhlIHJlYWwgdXNl
Y2FzZSB3aWxsIGhlbHAKdXMgY29udmVyZ2Ugb24gYSBzb2x1dGlvbi4gR2l2ZW4geW91IHdvcmsg
Zm9yIGEgaGFyZHdhcmUgdmVuZG9yIEknbQpndWVzc2luZyB0aGVyZSdzIHNvbWV0aGluZyB0aGF0
IHRyaWdnZXJzIGl0IHdpdGggYSBzcGVjaWZpYyBjYXJkCnlvdSBhcmUgdHJ5aW5nIHRvIHN1cHBv
cnQgYmV0dGVyLgoKCj4gCj4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBOb3Rl
IHRoYXQgdGhpcyBkcml2ZXIgaGFzIGJlZW4gdXNlZCBmb3IgcmVhbCBoYXJkd2FyZSBQQ0kKPiA+
ID4gPiA+ID4gZGV2aWNlcyBmb3IgbWFueSB5ZWFycy4gV2UgZG9uJ3QgcmVjZWl2ZSBhbnkgcmVw
b3J0IG9mIHRoaXMKPiA+ID4gPiA+ID4gYmVmb3JlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gVGhpcyBj
b21taXQgaXMgYWxzbyBhIHByZXBhcmF0aW9uIGZvciBhZGRpbmcgYSB0aW1lb3V0IG1lY2hhbmlz
bSBmb3IKPiA+ID4gPiA+ID4gPiA+ID4gcmVzZXR0aW5nIHZpcnRpbyBkZXZpY2VzLgo+ID4gPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF4IEd1cnRvdm95
IDxtZ3VydG92b3lAbnZpZGlhLmNvbT4KPiA+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBjaGFuZ2VzIGZyb20gdjE6Cj4gPiA+ID4gPiA+ID4g
PiA+ICDCoCAtIHVwZGF0ZSB2aXJ0aW9fY2N3LmMgKENvcm5lbGlhKQo+ID4gPiA+ID4gPiA+ID4g
PiAgwqAgLSB1cGRhdGUgdmlydGlvX3VtbC5jCj4gPiA+ID4gPiA+ID4gPiA+ICDCoCAtIHVwZGF0
ZSBtbHhiZi10bWZpZm8uYwo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBOb3RlIHRo
YXQgdmlydGlvIGRyaXZlciBtYXkgY2FsbCByZXNldCwgc28geW91IHByb2JhYmx5Cj4gPiA+ID4g
PiA+ID4gPiBuZWVkIHRvIGNvbnZlcnQgdGhlbS4KPiA+ID4gPiA+ID4gPiBJJ20gc3VyZSBJIHVu
ZGVyc3RhbmQuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQ29udmVydCB0byB3aGF0ID8K
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IENvbnZlcnQgdG8gZGVhbCB3aXRoIHRoZSBwb3NzaWJs
ZSByZXN0IGZhaWx1cmUuIEUuZyBpbgo+ID4gPiA+ID4gPiB2aXJ0YmxrX2ZyZWV6ZSgpIHdlIGhh
ZDoKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IHN0YXRpYyBpbnQgdmlydGJsa19mcmVlemUoc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+ID4gPiA+IHsKPiA+ID4gPiA+ID4gIMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCB2aXJ0aW9fYmxrICp2YmxrID0gdmRldi0+cHJpdjsKPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoCAvKiBFbnN1cmUgd2UgZG9uJ3QgcmVjZWl2
ZSBhbnkgbW9yZSBpbnRlcnJ1cHRzICovCj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoCB2ZGV2
LT5jb25maWctPnJlc2V0KHZkZXYpOwo+ID4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IFdlIG5lZWQgZmFpbCB0aGUgZnJlZXplIGhlcmUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IEFncmVlLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQW5vdGhlciBleGFtcGxl
IGlzIHRoZSBkcml2ZXIgcmVtb3ZlIHdoaWNoIGlzIG5vdCBleHBlY3RlZCB0byBiZQo+ID4gPiA+
ID4gPiBmYWlsLiBBIGxvdCBvZiB2aXJ0aW8gZHJpdmVycyB0cmllcyB0byBjYWxsIHJlc2V0IHRo
ZXJlLiBJJ20gbm90Cj4gPiA+ID4gPiA+IHN1cmUgaG93IGhhcmQgdG8gZGVhbCB3aXRoIHRoZSBm
YWlsdXJlIGluIHRoZSBwYXRoIG9mIHJlbW92ZQo+ID4gPiA+ID4gPiAoZS5nIF9fZGV2aWNlX3Jl
bGVhc2VfZHJpdmVyIHRlbmRzIHRvIGlnbm9yZSB0aGUgcmV0dXJuIHZhbHVlIG9mCj4gPiA+ID4g
PiA+IGJ1cy0+cmVtb3ZlKCkuKQo+ID4gPiA+ID4gSSB0aGluayBpdCBjYW4gc3RheSBhcy1pcyBh
bmQgaWdub3JlIHRoZSAtPnJlc2V0IHJldHVybiB2YWx1ZSBhbmQKPiA+ID4gPiA+IGNvbnRpbnVl
IGZyZWUgdGhlIG90aGVyIHJlc291cmNlcyB0byBhdm9pZCBsZWFrYWdlLgo+ID4gPiA+IAo+ID4g
PiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQncyB1bmNsZWFyIHRoYXQgd2hhdCBraW5kIG9mIGJl
aGF2aW91ciB3b3VsZCB0aGUKPiA+ID4gPiBkZXZpY2UgZG8sIGUuZyBjYW4gaXQgc3RpbGwgc2Vu
ZCBpbnRlcnJ1cHRzPwo+ID4gPiA+IAo+ID4gPiA+IFRoYXQncyB3aHkgd2UgbmVlZCB0byBmb3Jt
YWxpemUgdGhlIGJhaHZpb3VyIGZpcnN0IGlmIG5lY2Vzc2FyeS4KPiA+ID4gPiAKPiA+ID4gPiBU
aGFua3MKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGFua3MKPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoYW5rcy4KPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiA+ICDCoCBhcmNoL3VtL2Ry
aXZlcnMvdmlydGlvX3VtbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrKy0KPiA+
ID4gPiA+ID4gPiA+ID4gIMKgIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZv
LmMgfMKgIDQgKysrLQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgZHJpdmVycy9yZW1vdGVwcm9jL3Jl
bW90ZXByb2NfdmlydGlvLmPCoMKgIHzCoCA0ICsrKy0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIGRy
aXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKysr
KystLS0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIGRyaXZlcnMvdmlydGlvL3ZpcnRpby5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIyCj4gPiA+ID4gPiA+ID4gPiA+ICsrKysr
KysrKysrKysrKy0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIGRyaXZlcnMvdmlydGlvL3Zp
cnRpb19tbWlvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKystCj4gPiA+ID4gPiA+
ID4gPiA+ICDCoCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX2xlZ2FjeS5jwqDCoMKgwqDCoMKg
IHzCoCA0ICsrKy0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19w
Y2lfbW9kZXJuLmPCoMKgwqDCoMKgwqAgfMKgIDMgKystCj4gPiA+ID4gPiA+ID4gPiA+ICDCoCBk
cml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0
ICsrKy0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIGluY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5o
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArKystLQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAg
MTAgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4gPiA+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC91bS9kcml2
ZXJzL3ZpcnRpb191bWwuYwo+ID4gPiA+ID4gPiA+ID4gPiBiL2FyY2gvdW0vZHJpdmVycy92aXJ0
aW9fdW1sLmMKPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggOTFkZGY3NGNhODg4Li5iNmU2NjI2NWVk
MzIgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2FyY2gvdW0vZHJpdmVycy92aXJ0aW9f
dW1sLmMKPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvYXJjaC91bS9kcml2ZXJzL3ZpcnRpb191bWwu
Ywo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtODI3LDExICs4MjcsMTMgQEAgc3RhdGljIHZvaWQKPiA+
ID4gPiA+ID4gPiA+ID4gdnVfc2V0X3N0YXR1cyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwg
dTggc3RhdHVzKQo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCB2dV9kZXYtPnN0YXR1cyA9
IHN0YXR1czsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIH0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIC1z
dGF0aWMgdm9pZCB2dV9yZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+ID4gPiA+
ID4gPiA+ID4gK3N0YXRpYyBpbnQgdnVfcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYp
Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCB7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIHN0
cnVjdCB2aXJ0aW9fdW1sX2RldmljZSAqdnVfZGV2ID0gdG9fdmlydGlvX3VtbF9kZXZpY2UodmRl
dik7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoMKgwqDCoMKgIHZ1X2Rldi0+c3RhdHVzID0gMDsK
PiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIHJldHVybiAwOwo+
ID4gPiA+ID4gPiA+ID4gPiAgwqAgfQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgwqAgc3RhdGljIHZv
aWQgdnVfZGVsX3ZxKHN0cnVjdCB2aXJ0cXVldWUgKnZxKQo+ID4gPiA+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0Cj4gPiA+ID4gPiA+ID4gPiA+IGEvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhi
Zi10bWZpZm8uYwo+ID4gPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gv
bWx4YmYtdG1maWZvLmMKPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggYmJjNGU3MWExNmZmLi5jMTky
YjhhYzVkOWUgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0v
bWVsbGFub3gvbWx4YmYtdG1maWZvLmMKPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9tbHhiZi10bWZpZm8uYwo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtOTgw
LDExICs5ODAsMTMgQEAgc3RhdGljIHZvaWQKPiA+ID4gPiA+ID4gPiA+ID4gbWx4YmZfdG1maWZv
X3ZpcnRpb19zZXRfc3RhdHVzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlCj4gPiA+ID4gPiA+ID4gPiA+
ICp2ZGV2LAo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgfQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgwqAg
LyogUmVzZXQgdGhlIGRldmljZS4gTm90IG11Y2ggaGVyZSBmb3Igbm93LiAqLwo+ID4gPiA+ID4g
PiA+ID4gPiAtc3RhdGljIHZvaWQgbWx4YmZfdG1maWZvX3ZpcnRpb19yZXNldChzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldikKPiA+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgbWx4YmZfdG1m
aWZvX3ZpcnRpb19yZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+ID4gPiA+ID4g
PiA+ID4gIMKgIHsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgc3RydWN0IG1seGJmX3Rt
Zmlmb192ZGV2ICp0bV92ZGV2ID0KPiA+ID4gPiA+ID4gPiA+ID4gbWx4YmZfdmRldl90b190bWZp
Zm8odmRldik7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoMKgwqDCoMKgIHRtX3ZkZXYtPnN0YXR1
cyA9IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCByZXR1
cm4gMDsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIH0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIMKgIC8q
IFJlYWQgdGhlIHZhbHVlIG9mIGEgY29uZmlndXJhdGlvbiBmaWVsZC4gKi8KPiA+ID4gPiA+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX3ZpcnRpby5j
Cj4gPiA+ID4gPiA+ID4gPiA+IGIvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfdmlydGlv
LmMKPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggMGNjNjE3Zjc2MDY4Li5jYTk1NzNjNjJjM2QgMTAw
NjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9j
X3ZpcnRpby5jCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1v
dGVwcm9jX3ZpcnRpby5jCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xOTEsNyArMTkxLDcgQEAgc3Rh
dGljIHZvaWQKPiA+ID4gPiA+ID4gPiA+ID4gcnByb2NfdmlydGlvX3NldF9zdGF0dXMoc3RydWN0
IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gPiA+ID4gPiA+ID4gPiA+IHU4IHN0YXR1cykKPiA+ID4g
PiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgZGV2X2RiZygmdmRldi0+ZGV2LCAic3RhdHVzOiAlZFxu
Iiwgc3RhdHVzKTsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIH0KPiA+ID4gPiA+ID4gPiA+ID4gIMKg
IC1zdGF0aWMgdm9pZCBycHJvY192aXJ0aW9fcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZk
ZXYpCj4gPiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgaW50IHJwcm9jX3ZpcnRpb19yZXNldChzdHJ1
Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIHsKPiA+ID4gPiA+
ID4gPiA+ID4gIMKgwqDCoMKgwqAgc3RydWN0IHJwcm9jX3ZkZXYgKnJ2ZGV2ID0gdmRldl90b19y
dmRldih2ZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgc3RydWN0IGZ3X3JzY192
ZGV2ICpyc2M7Cj4gPiA+ID4gPiA+ID4gPiA+IEBAIC0yMDAsNiArMjAwLDggQEAgc3RhdGljIHZv
aWQKPiA+ID4gPiA+ID4gPiA+ID4gcnByb2NfdmlydGlvX3Jlc2V0KHN0cnVjdCB2aXJ0aW9fZGV2
aWNlICp2ZGV2KQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgwqDCoMKgwqDCoCByc2MtPnN0YXR1cyA9
IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIGRldl9kYmcoJnZkZXYtPmRldiwgInJl
c2V0ICFcbiIpOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAg
cmV0dXJuIDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCB9Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDC
oCAvKiBwcm92aWRlIHRoZSB2ZGV2IGZlYXR1cmVzIGFzIHJldHJpZXZlZCBmcm9tIHRoZSBmaXJt
d2FyZSAqLwo+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL3ZpcnRp
by92aXJ0aW9fY2N3LmMKPiA+ID4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL3MzOTAvdmlydGlvL3Zp
cnRpb19jY3cuYwo+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCA1NGU2ODZkY2E2ZGUuLjUyYjMyNTU1
ZTc0NiAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9zMzkwL3ZpcnRpby92
aXJ0aW9fY2N3LmMKPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9zMzkwL3ZpcnRpby92
aXJ0aW9fY2N3LmMKPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTczMiwxNCArNzMyLDE1IEBAIHN0YXRp
YyBpbnQKPiA+ID4gPiA+ID4gPiA+ID4gdmlydGlvX2Njd19maW5kX3ZxcyhzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldiwKPiA+ID4gPiA+ID4gPiA+ID4gdW5zaWduZWQgbnZxcywKPiA+ID4gPiA+
ID4gPiA+ID4gIMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIH0K
PiA+ID4gPiA+ID4gPiA+ID4gIMKgIC1zdGF0aWMgdm9pZCB2aXJ0aW9fY2N3X3Jlc2V0KHN0cnVj
dCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gPiA+ID4gPiA+ID4gPiArc3RhdGljIGludCB2aXJ0
aW9fY2N3X3Jlc2V0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gPiA+ID4gPiA+ID4g
PiAgwqAgewo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydGlvX2Njd19k
ZXZpY2UgKnZjZGV2ID0gdG9fdmNfZGV2aWNlKHZkZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiAgwqDC
oMKgwqDCoCBzdHJ1Y3QgY2N3MSAqY2N3Owo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIGludCBy
ZXQ7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoMKgwqDCoMKgIGNjdyA9IGNjd19kZXZpY2VfZG1h
X3phbGxvYyh2Y2Rldi0+Y2Rldiwgc2l6ZW9mKCpjY3cpKTsKPiA+ID4gPiA+ID4gPiA+ID4gIMKg
wqDCoMKgwqAgaWYgKCFjY3cpCj4gPiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCByZXR1
cm47Cj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPiA+
ID4gPiA+ID4gPiA+ID4gIMKgIMKgwqDCoMKgwqAgLyogWmVybyBzdGF0dXMgYml0cy4gKi8KPiA+
ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgdmNkZXYtPmRtYV9hcmVhLT5zdGF0dXMgPSAwOwo+
ID4gPiA+ID4gPiA+ID4gPiBAQCAtNzQ5LDggKzc1MCwxMCBAQCBzdGF0aWMgdm9pZAo+ID4gPiA+
ID4gPiA+ID4gPiB2aXJ0aW9fY2N3X3Jlc2V0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+
ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCBjY3ctPmZsYWdzID0gMDsKPiA+ID4gPiA+ID4g
PiA+ID4gIMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKg
wqDCoMKgIGNjdy0+Y2RhID0gMDsKPiA+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoCBjY3dfaW9faGVs
cGVyKHZjZGV2LCBjY3csIFZJUlRJT19DQ1dfRE9JTkdfUkVTRVQpOwo+ID4gPiA+ID4gPiA+ID4g
PiArwqDCoMKgIHJldCA9IGNjd19pb19oZWxwZXIodmNkZXYsIGNjdywgVklSVElPX0NDV19ET0lO
R19SRVNFVCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIGNjd19kZXZpY2VfZG1hX2Zy
ZWUodmNkZXYtPmNkZXYsIGNjdywgc2l6ZW9mKCpjY3cpKTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiA+ID4gPiA+ICDC
oCB9Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoCBzdGF0aWMgdTY0IHZpcnRpb19jY3dfZ2V0X2Zl
YXR1cmVzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gPiA+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW8u
Ywo+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCA0YjE1YzAwYzBhMGEuLmRkYmZkNWI1ZjNiZCAxMDA2
NDQKPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvLmMKPiA+ID4g
PiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvLmMKPiA+ID4gPiA+ID4gPiA+
ID4gQEAgLTMzOCw3ICszMzgsNyBAQCBpbnQKPiA+ID4gPiA+ID4gPiA+ID4gcmVnaXN0ZXJfdmly
dGlvX2RldmljZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqZGV2KQo+ID4gPiA+ID4gPiA+ID4gPiAg
wqDCoMKgwqDCoCAvKiBBc3NpZ24gYSB1bmlxdWUgZGV2aWNlIGluZGV4IGFuZCBoZW5jZSBuYW1l
LiAqLwo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCBlcnIgPSBpZGFfc2ltcGxlX2dldCgm
dmlydGlvX2luZGV4X2lkYSwgMCwgMCwgR0ZQX0tFUk5FTCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICDC
oMKgwqDCoMKgIGlmIChlcnIgPCAwKQo+ID4gPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAg
Z290byBvdXQ7Cj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9lcnI7
Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoMKgwqDCoMKgIGRldi0+aW5kZXggPSBlcnI7Cj4gPiA+
ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIGRldl9zZXRfbmFtZSgmZGV2LT5kZXYsICJ2aXJ0aW8l
dSIsIGRldi0+aW5kZXgpOwo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzQ5LDcgKzM0OSw5IEBAIGlu
dAo+ID4gPiA+ID4gPiA+ID4gPiByZWdpc3Rlcl92aXJ0aW9fZGV2aWNlKHN0cnVjdCB2aXJ0aW9f
ZGV2aWNlICpkZXYpCj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoMKgwqDCoMKgIC8qIFdlIGFsd2F5
cyBzdGFydCBieSByZXNldHRpbmcgdGhlIGRldmljZSwKPiA+ID4gPiA+ID4gPiA+ID4gaW4gY2Fz
ZSBhIHByZXZpb3VzCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqAgKiBkcml2ZXIgbWVz
c2VkIGl0IHVwLsKgIFRoaXMgYWxzbyB0ZXN0cyB0aGF0Cj4gPiA+ID4gPiA+ID4gPiA+IGNvZGUg
cGF0aCBhIGxpdHRsZS4gKi8KPiA+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoCBkZXYtPmNvbmZpZy0+
cmVzZXQoZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCBlcnIgPSBkZXYtPmNvbmZpZy0+
cmVzZXQoZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCBpZiAoZXJyKQo+ID4gPiA+ID4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfaWRhOwo+ID4gPiA+ID4gPiA+ID4gPiAg
wqAgwqDCoMKgwqDCoCAvKiBBY2tub3dsZWRnZSB0aGF0IHdlJ3ZlIHNlZW4gdGhlIGRldmljZS4g
Ki8KPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgdmlydGlvX2FkZF9zdGF0dXMoZGV2LCBW
SVJUSU9fQ09ORklHX1NfQUNLTk9XTEVER0UpOwo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzYyLDEw
ICszNjQsMTQgQEAgaW50Cj4gPiA+ID4gPiA+ID4gPiA+IHJlZ2lzdGVyX3ZpcnRpb19kZXZpY2Uo
c3RydWN0IHZpcnRpb19kZXZpY2UgKmRldikKPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqDC
oCAqLwo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCBlcnIgPSBkZXZpY2VfYWRkKCZkZXYt
PmRldik7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIGlmIChlcnIpCj4gPiA+ID4gPiA+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCBpZGFfc2ltcGxlX3JlbW92ZSgmdmlydGlvX2luZGV4X2lk
YSwgZGV2LT5pbmRleCk7Cj4gPiA+ID4gPiA+ID4gPiA+IC1vdXQ6Cj4gPiA+ID4gPiA+ID4gPiA+
IC3CoMKgwqAgaWYgKGVycikKPiA+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIHZpcnRp
b19hZGRfc3RhdHVzKGRldiwgVklSVElPX0NPTkZJR19TX0ZBSUxFRCk7Cj4gPiA+ID4gPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9pZGE7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCByZXR1cm4gMDsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiArb3V0X2lkYToKPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCBpZGFfc2lt
cGxlX3JlbW92ZSgmdmlydGlvX2luZGV4X2lkYSwgZGV2LT5pbmRleCk7Cj4gPiA+ID4gPiA+ID4g
PiA+ICtvdXRfZXJyOgo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIHZpcnRpb19hZGRfc3RhdHVz
KGRldiwgVklSVElPX0NPTkZJR19TX0ZBSUxFRCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDC
oMKgIHJldHVybiBlcnI7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCB9Cj4gPiA+ID4gPiA+ID4gPiA+
ICDCoCBFWFBPUlRfU1lNQk9MX0dQTChyZWdpc3Rlcl92aXJ0aW9fZGV2aWNlKTsKPiA+ID4gPiA+
ID4gPiA+ID4gQEAgLTQwOCw3ICs0MTQsOSBAQCBpbnQgdmlydGlvX2RldmljZV9yZXN0b3JlKHN0
cnVjdAo+ID4gPiA+ID4gPiA+ID4gPiB2aXJ0aW9fZGV2aWNlICpkZXYpCj4gPiA+ID4gPiA+ID4g
PiA+ICDCoCDCoMKgwqDCoMKgIC8qIFdlIGFsd2F5cyBzdGFydCBieSByZXNldHRpbmcgdGhlIGRl
dmljZSwKPiA+ID4gPiA+ID4gPiA+ID4gaW4gY2FzZSBhIHByZXZpb3VzCj4gPiA+ID4gPiA+ID4g
PiA+ICDCoMKgwqDCoMKgwqAgKiBkcml2ZXIgbWVzc2VkIGl0IHVwLiAqLwo+ID4gPiA+ID4gPiA+
ID4gPiAtwqDCoMKgIGRldi0+Y29uZmlnLT5yZXNldChkZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiAr
wqDCoMKgIHJldCA9IGRldi0+Y29uZmlnLT5yZXNldChkZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiAr
wqDCoMKgIGlmIChyZXQpCj4gPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cjsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIMKgwqDCoMKgwqAgLyogQWNrbm93bGVkZ2UgdGhhdCB3
ZSd2ZSBzZWVuIHRoZSBkZXZpY2UuICovCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIHZp
cnRpb19hZGRfc3RhdHVzKGRldiwgVklSVElPX0NPTkZJR19TX0FDS05PV0xFREdFKTsKPiA+ID4g
PiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiA+
ID4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jCj4gPiA+ID4gPiA+
ID4gPiA+IGluZGV4IDU2MTI4YjljNDZlYi4uMTJiOGYwNDhjNDhkIDEwMDY0NAo+ID4gPiA+ID4g
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jCj4gPiA+ID4gPiA+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiA+ID4gPiA+ID4gPiA+ID4g
QEAgLTI1NiwxMiArMjU2LDEzIEBAIHN0YXRpYyB2b2lkCj4gPiA+ID4gPiA+ID4gPiA+IHZtX3Nl
dF9zdGF0dXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHU4IHN0YXR1cykKPiA+ID4gPiA+
ID4gPiA+ID4gIMKgwqDCoMKgwqAgd3JpdGVsKHN0YXR1cywgdm1fZGV2LT5iYXNlICsgVklSVElP
X01NSU9fU1RBVFVTKTsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIH0KPiA+ID4gPiA+ID4gPiA+ID4g
IMKgIC1zdGF0aWMgdm9pZCB2bV9yZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+
ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgdm1fcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2Ug
KnZkZXYpCj4gPiA+ID4gPiA+ID4gPiA+ICDCoCB7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDC
oMKgIHN0cnVjdCB2aXJ0aW9fbW1pb19kZXZpY2UgKnZtX2RldiA9Cj4gPiA+ID4gPiA+ID4gPiA+
IHRvX3ZpcnRpb19tbWlvX2RldmljZSh2ZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgIMKgwqDC
oMKgwqAgLyogMCBzdGF0dXMgbWVhbnMgYSByZXNldC4gKi8KPiA+ID4gPiA+ID4gPiA+ID4gIMKg
wqDCoMKgwqAgd3JpdGVsKDAsIHZtX2Rldi0+YmFzZSArIFZJUlRJT19NTUlPX1NUQVRVUyk7Cj4g
PiA+ID4gPiA+ID4gPiA+ICvCoMKgwqAgcmV0dXJuIDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCB9
Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCDCoCBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmly
dGlvX3BjaV9sZWdhY3kuYwo+ID4gPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19wY2lfbGVnYWN5LmMKPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggZDYyZTk4MzVhZWVjLi4wYjVk
OTVlM2VmYTEgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3Zp
cnRpb19wY2lfbGVnYWN5LmMKPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aXJ0aW8v
dmlydGlvX3BjaV9sZWdhY3kuYwo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtODksNyArODksNyBAQCBz
dGF0aWMgdm9pZCB2cF9zZXRfc3RhdHVzKHN0cnVjdAo+ID4gPiA+ID4gPiA+ID4gPiB2aXJ0aW9f
ZGV2aWNlICp2ZGV2LCB1OCBzdGF0dXMpCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIGlv
d3JpdGU4KHN0YXR1cywgdnBfZGV2LT5pb2FkZHIgKyBWSVJUSU9fUENJX1NUQVRVUyk7Cj4gPiA+
ID4gPiA+ID4gPiA+ICDCoCB9Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCAtc3RhdGljIHZvaWQgdnBf
cmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+ID4gPiA+ID4gPiA+ICtzdGF0
aWMgaW50IHZwX3Jlc2V0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gPiA+ID4gPiA+
ID4gPiAgwqAgewo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydGlvX3Bj
aV9kZXZpY2UgKnZwX2RldiA9IHRvX3ZwX2RldmljZSh2ZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4g
IMKgwqDCoMKgwqAgLyogMCBzdGF0dXMgbWVhbnMgYSByZXNldC4gKi8KPiA+ID4gPiA+ID4gPiA+
ID4gQEAgLTk5LDYgKzk5LDggQEAgc3RhdGljIHZvaWQgdnBfcmVzZXQoc3RydWN0IHZpcnRpb19k
ZXZpY2UgKnZkZXYpCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIGlvcmVhZDgodnBfZGV2
LT5pb2FkZHIgKyBWSVJUSU9fUENJX1NUQVRVUyk7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDC
oMKgIC8qIEZsdXNoIHBlbmRpbmcgVlEvY29uZmlndXJhdGlvbiBjYWxsYmFja3MuICovCj4gPiA+
ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgIHZwX3N5bmNocm9uaXplX3ZlY3RvcnModmRldik7Cj4g
PiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCByZXR1cm4gMDsKPiA+
ID4gPiA+ID4gPiA+ID4gIMKgIH0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIMKgIHN0YXRpYyB1MTYg
dnBfY29uZmlnX3ZlY3RvcihzdHJ1Y3QKPiA+ID4gPiA+ID4gPiA+ID4gdmlydGlvX3BjaV9kZXZp
Y2UgKnZwX2RldiwgdTE2IHZlY3RvcikKPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMKPiA+ID4gPiA+ID4gPiA+ID4gYi9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jCj4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IGZi
ZDRlYmMwMGViNi4uY2MzNDEyYTk2YTE3IDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMKPiA+ID4gPiA+ID4gPiA+ID4gQEAg
LTE1OCw3ICsxNTgsNyBAQCBzdGF0aWMgdm9pZCB2cF9zZXRfc3RhdHVzKHN0cnVjdAo+ID4gPiA+
ID4gPiA+ID4gPiB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1OCBzdGF0dXMpCj4gPiA+ID4gPiA+ID4g
PiA+ICDCoMKgwqDCoMKgIHZwX21vZGVybl9zZXRfc3RhdHVzKCZ2cF9kZXYtPm1kZXYsIHN0YXR1
cyk7Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCB9Cj4gPiA+ID4gPiA+ID4gPiA+ICDCoCAtc3RhdGlj
IHZvaWQgdnBfcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+ID4gPiA+ID4g
PiA+ICtzdGF0aWMgaW50IHZwX3Jlc2V0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4g
PiA+ID4gPiA+ID4gPiAgwqAgewo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCBzdHJ1Y3Qg
dmlydGlvX3BjaV9kZXZpY2UgKnZwX2RldiA9IHRvX3ZwX2RldmljZSh2ZGV2KTsKPiA+ID4gPiA+
ID4gPiA+ID4gIMKgwqDCoMKgwqAgc3RydWN0IHZpcnRpb19wY2lfbW9kZXJuX2RldmljZSAqbWRl
diA9ICZ2cF9kZXYtPm1kZXY7Cj4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xNzQsNiArMTc0LDcgQEAg
c3RhdGljIHZvaWQgdnBfcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+ID4g
PiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqAgbXNsZWVwKDEpOwo+ID4gPiA+ID4gPiA+ID4g
PiAgwqDCoMKgwqDCoCAvKiBGbHVzaCBwZW5kaW5nIFZRL2NvbmZpZ3VyYXRpb24gY2FsbGJhY2tz
LiAqLwo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCB2cF9zeW5jaHJvbml6ZV92ZWN0b3Jz
KHZkZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgIHJldHVybiAwOwo+ID4gPiA+ID4gPiA+
ID4gPiAgwqAgfQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgwqAgc3RhdGljIHUxNiB2cF9jb25maWdf
dmVjdG9yKHN0cnVjdAo+ID4gPiA+ID4gPiA+ID4gPiB2aXJ0aW9fcGNpX2RldmljZSAqdnBfZGV2
LCB1MTYgdmVjdG9yKQo+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0
aW8vdmlydGlvX3ZkcGEuYwo+ID4gPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b192ZHBhLmMKPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggZTI4YWNmNDgyZTBjLi41ZmQ0ZTYyN2E5
YjAgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb192
ZHBhLmMKPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEu
Ywo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtOTcsMTEgKzk3LDEzIEBAIHN0YXRpYyB2b2lkCj4gPiA+
ID4gPiA+ID4gPiA+IHZpcnRpb192ZHBhX3NldF9zdGF0dXMoc3RydWN0IHZpcnRpb19kZXZpY2Ug
KnZkZXYsCj4gPiA+ID4gPiA+ID4gPiA+IHU4IHN0YXR1cykKPiA+ID4gPiA+ID4gPiA+ID4gIMKg
wqDCoMKgwqAgcmV0dXJuIG9wcy0+c2V0X3N0YXR1cyh2ZHBhLCBzdGF0dXMpOwo+ID4gPiA+ID4g
PiA+ID4gPiAgwqAgfQo+ID4gPiA+ID4gPiA+ID4gPiAgwqAgLXN0YXRpYyB2b2lkIHZpcnRpb192
ZHBhX3Jlc2V0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gPiA+ID4gPiA+ID4gPiAr
c3RhdGljIGludCB2aXJ0aW9fdmRwYV9yZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikK
PiA+ID4gPiA+ID4gPiA+ID4gIMKgIHsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhID0gdmRfZ2V0X3ZkcGEodmRldik7Cj4gPiA+ID4gPiA+ID4g
PiA+ICDCoCDCoMKgwqDCoMKgIHZkcGFfcmVzZXQodmRwYSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoCByZXR1cm4gMDsKPiA+ID4gPiA+ID4gPiA+ID4gIMKg
IH0KPiA+ID4gPiA+ID4gPiA+ID4gIMKgIMKgIHN0YXRpYyBib29sIHZpcnRpb192ZHBhX25vdGlm
eShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oCj4gPiA+ID4gPiA+ID4gPiA+IGIvaW5jbHVkZS9s
aW51eC92aXJ0aW9fY29uZmlnLmgKPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggODUxOWIzYWU1ZDUy
Li5kMmIwZjE2OTlhNzUgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvdmlydGlvX2NvbmZpZy5oCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgv
dmlydGlvX2NvbmZpZy5oCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC00NCw5ICs0NCwxMCBAQCBzdHJ1
Y3QgdmlydGlvX3NobV9yZWdpb24gewo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoCAqwqDCoMKgIHN0
YXR1czogdGhlIG5ldyBzdGF0dXMgYnl0ZQo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoCAqIEByZXNl
dDogcmVzZXQgdGhlIGRldmljZQo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoCAqwqDCoMKgIHZkZXY6
IHRoZSB2aXJ0aW8gZGV2aWNlCj4gPiA+ID4gPiA+ID4gPiA+IC0gKsKgwqDCoCBBZnRlciB0aGlz
LCBzdGF0dXMgYW5kIGZlYXR1cmUgbmVnb3RpYXRpb24gbXVzdCBiZSBkb25lIGFnYWluCj4gPiA+
ID4gPiA+ID4gPiA+ICsgKsKgwqDCoCBVcG9uIHN1Y2Nlc3MsIHN0YXR1cyBhbmQgZmVhdHVyZSBu
ZWdvdGlhdGlvbgo+ID4gPiA+ID4gPiA+ID4gPiBtdXN0IGJlIGRvbmUgYWdhaW4KPiA+ID4gPiA+
ID4gPiA+ID4gIMKgwqAgKsKgwqDCoCBEZXZpY2UgbXVzdCBub3QgYmUgcmVzZXQgZnJvbSBpdHMg
dnEvY29uZmlnIGNhbGxiYWNrcywgb3IgaW4KPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqAgKsKgwqDC
oCBwYXJhbGxlbCB3aXRoIGJlaW5nIGFkZGVkL3JlbW92ZWQuCj4gPiA+ID4gPiA+ID4gPiA+ICsg
KsKgwqDCoCBSZXR1cm5zIDAgb24gc3VjY2VzcyBvciBlcnJvciBzdGF0dXMuCj4gPiA+ID4gPiA+
ID4gPiA+ICDCoMKgICogQGZpbmRfdnFzOiBmaW5kIHZpcnRxdWV1ZXMgYW5kIGluc3RhbnRpYXRl
IHRoZW0uCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgICrCoMKgwqAgdmRldjogdGhlIHZpcnRpb19k
ZXZpY2UKPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqAgKsKgwqDCoCBudnFzOiB0aGUgbnVtYmVyIG9m
IHZpcnRxdWV1ZXMgdG8gZmluZAo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtODIsNyArODMsNyBAQCBz
dHJ1Y3QgdmlydGlvX2NvbmZpZ19vcHMgewo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCB1
MzIgKCpnZW5lcmF0aW9uKShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldik7Cj4gPiA+ID4gPiA+
ID4gPiA+ICDCoMKgwqDCoMKgIHU4ICgqZ2V0X3N0YXR1cykoc3RydWN0IHZpcnRpb19kZXZpY2Ug
KnZkZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqDCoCB2b2lkICgqc2V0X3N0YXR1cyko
c3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHU4IHN0YXR1cyk7Cj4gPiA+ID4gPiA+ID4gPiA+
IC3CoMKgwqAgdm9pZCAoKnJlc2V0KShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldik7Cj4gPiA+
ID4gPiA+ID4gPiA+ICvCoMKgwqAgaW50ICgqcmVzZXQpKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2
ZGV2KTsKPiA+ID4gPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqAgaW50ICgqZmluZF92cXMpKHN0cnVj
dCB2aXJ0aW9fZGV2aWNlICosIHVuc2lnbmVkIG52cXMsCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydHF1ZXVlICp2cXNbXSwgdnFfY2FsbGJh
Y2tfdCAqY2FsbGJhY2tzW10sCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb25zdCBjaGFyICogY29uc3QgbmFtZXNbXSwgY29uc3QgYm9vbCAqY3R4LAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
