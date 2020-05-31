Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 803711E95F4
	for <lists.virtualization@lfdr.de>; Sun, 31 May 2020 09:03:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E5FAD20370;
	Sun, 31 May 2020 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teTtc0K5zO1X; Sun, 31 May 2020 07:03:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B3B5D2036B;
	Sun, 31 May 2020 07:03:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 701D9C0176;
	Sun, 31 May 2020 07:03:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45AFFC0176
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 07:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 313C686004
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 07:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXhHQHz02Y1d
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 07:03:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 22BC585F54
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 07:03:13 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z18so4186082lji.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=orX/y8KZmJNFBM29Gj7r/7pgbaU1Wmo90frTAFgI1II=;
 b=HxqCyM1EcKPbKMqPglb23SznK7zXBoHpxAe9uB5JZW4tnTxun6GQOGDw+5tBcOaECm
 suvkefwQ8xbLMfVC0td4JIZo/MMBvKSj6BexhDRnxlbkIPb/scSpoVVPe143s/vDo4EC
 sP/LA3rn6FUKhnOs2cy+7Ln4pSfdQzUvT/GVMCO+HuBezDF+raa3MHX6WRGeIUKvbY0b
 /rQt0v1xJO4cQB3MVfq6unPXq/6Y7qyuavQKhIX2u0UJKEr+1qoFR2p6oCwqk1XAj1SF
 fukGMWUxvbvVYgv1Oau5RfuKCOLwZnXQ2O3IS8CFpnidpslrSl5qRmZuHTYhOE49Ep23
 O3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=orX/y8KZmJNFBM29Gj7r/7pgbaU1Wmo90frTAFgI1II=;
 b=aIzoBL97MT3d6YNGDR6rJpwgKr8hoHvt4S0MZFC2+RRr413vPNR7iDtDM1lpnGegky
 4iHyJG57kjY7bIc+FbR2miUJrH54en0ie0AZaZneAWRCJzUS0MZ2gsOgUqT3q3x+wMIj
 f+gl5n7AUw6LIXUOIntPIRxwduyjm9YB/WpH2+utouSuMwPJhr2IG/Ao5oK0GPiyLl+l
 hslKbgMqBvdoHpLa3YCGFT+gSkfTNJU7SDZUKj3t2vvrZfKJYSEBvgxBaQ/B8AuE0UmT
 d0tu1WDNPZ/AIaKp4aG16M1Nxc0Rj0iTJI2tP9GtJm8iVvfx63aAmK35KVDQ2O/RYili
 PbAQ==
X-Gm-Message-State: AOAM530QiipZ57ePTIMEjukA79Rz9XPmERmddGZNXhxc+gviP6YuUwr2
 6VRfNCtYdk0Svxeq2ogaFIJ0ZSNq7z7f0A52sYQ=
X-Google-Smtp-Source: ABdhPJywHXsqBndX3laZcwix8rl6zEFIaUWSsfG6YMGcM9LSe//w5BtrRO/NuMPavCMahVKPqbWUuUk4ilCBWssYdFI=
X-Received: by 2002:a2e:b5d7:: with SMTP id g23mr1384527ljn.70.1590908591076; 
 Sun, 31 May 2020 00:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200529234309.484480-1-jhubbard@nvidia.com>
 <20200529234309.484480-2-jhubbard@nvidia.com>
In-Reply-To: <20200529234309.484480-2-jhubbard@nvidia.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 31 May 2020 12:41:19 +0530
Message-ID: <CAFqt6zaCSngh7-N_qZ6-S3Cj8CHF8DTSPv8anP_oJg5E6UWu9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
To: John Hubbard <jhubbard@nvidia.com>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Linux-MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
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

T24gU2F0LCBNYXkgMzAsIDIwMjAgYXQgNToxMyBBTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIGZvdXIgY2FzZXMgbGlzdGVkIGluIHBpbl91
c2VyX3BhZ2VzLnJzdC4gVGhlc2UgYXJlCj4gaW50ZW5kZWQgdG8gaGVscCBkZXZlbG9wZXJzIGZp
Z3VyZSBvdXQgd2hldGhlciB0byB1c2UKPiBnZXRfdXNlcl9wYWdlcyooKSwgb3IgcGluX3VzZXJf
cGFnZXMqKCkuIEhvd2V2ZXIsIHRoZSBmb3VyIGNhc2VzCj4gZG8gbm90IGNvdmVyIGFsbCB0aGUg
c2l0dWF0aW9ucy4gRm9yIGV4YW1wbGUsIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IGhhcyBhICJw
aW4sIHdyaXRlIHRvIHBhZ2UsIHNldCBwYWdlIGRpcnR5LCB1bnBpbiIgY2FzZS4KPgo+IEFkZCBh
IGZpZnRoIGNhc2UsIHRvIGhlbHAgZXhwbGFpbiB0aGF0IHRoZXJlIGlzIGEgZ2VuZXJhbCBwYXR0
ZXJuCj4gdGhhdCByZXF1aXJlcyBwaW5fdXNlcl9wYWdlcyooKSBBUEkgY2FsbHMuCj4KPiBDYzog
Vmxhc3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4KPiBDYzogSmFuIEthcmEgPGphY2tAc3Vz
ZS5jej4KPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IERh
dmUgQ2hpbm5lciA8ZGF2aWRAZnJvbW9yYml0LmNvbT4KPiBDYzogSm9uYXRoYW4gQ29yYmV0IDxj
b3JiZXRAbHduLm5ldD4KPiBDYzogbGludXgtZG9jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51
eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9waW5f
dXNlcl9wYWdlcy5yc3QgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vY29yZS1h
cGkvcGluX3VzZXJfcGFnZXMucnN0IGIvRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9waW5fdXNlcl9w
YWdlcy5yc3QKPiBpbmRleCA0Njc1YjA0ZTg4MjkuLmI5ZjI2ODhhMmM2NyAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2NvcmUtYXBpL3Bpbl91c2VyX3BhZ2VzLnJzdAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vY29yZS1hcGkvcGluX3VzZXJfcGFnZXMucnN0Cj4gQEAgLTE3MSw2ICsxNzEsMjYg
QEAgSWYgb25seSBzdHJ1Y3QgcGFnZSBkYXRhIChhcyBvcHBvc2VkIHRvIHRoZSBhY3R1YWwgbWVt
b3J5IGNvbnRlbnRzIHRoYXQgYSBwYWdlCj4gIGlzIHRyYWNraW5nKSBpcyBhZmZlY3RlZCwgdGhl
biBub3JtYWwgR1VQIGNhbGxzIGFyZSBzdWZmaWNpZW50LCBhbmQgbmVpdGhlciBmbGFnCj4gIG5l
ZWRzIHRvIGJlIHNldC4KPgo+ICtDQVNFIDU6IFBpbm5pbmcgaW4gb3JkZXIgdG8gd3JpdGUgdG8g
dGhlIGRhdGEgd2l0aGluIHRoZSBwYWdlCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArRXZlbiB0aG91Z2ggbmVpdGhlciBE
TUEgbm9yIERpcmVjdCBJTyBpcyBpbnZvbHZlZCwganVzdCBhIHNpbXBsZSBjYXNlIG9mICJwaW4s
Cj4gK2FjY2VzcyBwYWdlJ3MgZGF0YSwgdW5waW4iIGNhbiBjYXVzZSBhIHByb2JsZW0uCgpXaWxs
IGl0IGJlLCAqInBpbiwgYWNjZXNzIHBhZ2UncyBkYXRhLCBzZXQgcGFnZSBkaXJ0eSwgdW5waW4i
ICogPwoKQ2FzZSA1IG1heSBiZSBjb25zaWRlcmVkIGEKPiArc3VwZXJzZXQgb2YgQ2FzZSAxLCBw
bHVzIENhc2UgMiwgcGx1cyBhbnl0aGluZyB0aGF0IGludm9rZXMgdGhhdCBwYXR0ZXJuLiBJbgo+
ICtvdGhlciB3b3JkcywgaWYgdGhlIGNvZGUgaXMgbmVpdGhlciBDYXNlIDEgbm9yIENhc2UgMiwg
aXQgbWF5IHN0aWxsIHJlcXVpcmUKPiArRk9MTF9QSU4sIGZvciBwYXR0ZXJucyBsaWtlIHRoaXM6
Cj4gKwo+ICtDb3JyZWN0ICh1c2VzIEZPTExfUElOIGNhbGxzKToKPiArICAgIHBpbl91c2VyX3Bh
Z2VzKCkKPiArICAgIGFjY2VzcyB0aGUgZGF0YSB3aXRoaW4gdGhlIHBhZ2VzCj4gKyAgICBzZXRf
cGFnZV9kaXJ0eV9sb2NrKCkKPiArICAgIHVucGluX3VzZXJfcGFnZXMoKQo+ICsKPiArSU5DT1JS
RUNUICh1c2VzIEZPTExfR0VUIGNhbGxzKToKPiArICAgIGdldF91c2VyX3BhZ2VzKCkKPiArICAg
IGFjY2VzcyB0aGUgZGF0YSB3aXRoaW4gdGhlIHBhZ2VzCj4gKyAgICBzZXRfcGFnZV9kaXJ0eV9s
b2NrKCkKPiArICAgIHB1dF9wYWdlKCkKPiArCj4gIHBhZ2VfbWF5YmVfZG1hX3Bpbm5lZCgpOiB0
aGUgd2hvbGUgcG9pbnQgb2YgcGlubmluZwo+ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPgo+IC0tCj4gMi4yNi4yCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
