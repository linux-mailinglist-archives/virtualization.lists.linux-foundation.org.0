Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CEE22091B
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:47:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4502C8918A;
	Wed, 15 Jul 2020 09:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjkD0ehCNRRN; Wed, 15 Jul 2020 09:47:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9FDD589186;
	Wed, 15 Jul 2020 09:47:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D041C0733;
	Wed, 15 Jul 2020 09:47:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5581C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 917338AFCA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmSgftPQKhU7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:47:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A53FE8AD9E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594806426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgFwB4sgqMo4IjWK8xGAhUdyzExkJ8Foocx1qbcXFec=;
 b=cELMly7a7cu/U3++mhRx3DvvxB8801E/9dv+HuXSSa8JWwFJ524sGgtRrJECXwElPwMHLD
 Xu0uCOv/gYMEJ3W9rTY6aAkxPsmv7pgqHDugdcVhwgp9j5wFwb745eVoINRjYM0VoOGu8b
 KvWPyELcMtPYj9HK3uutmSk858bEhsM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-ffxIYHwbPKqApkar21RZAg-1; Wed, 15 Jul 2020 05:47:05 -0400
X-MC-Unique: ffxIYHwbPKqApkar21RZAg-1
Received: by mail-wm1-f72.google.com with SMTP id y204so510863wmd.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 02:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fgFwB4sgqMo4IjWK8xGAhUdyzExkJ8Foocx1qbcXFec=;
 b=JuMxP9qgBZabdkbaqJP2ZQgURe60Ko3yi8bAgzM/bbgyYOTuHg61O+Yy/gOVbJftEy
 0qKs5ZGdixipF62EBM61UM1h3t4ZXpalU9jhzhqvuntbYkj9GRazYMNc+nJUjFbzYEBA
 hbgF8YsqzrKFPrfrLte99Qp/CaqBoxvw49GNH0ZAkx1VGzXvhZGzn/S0TBzJIJNkEZhJ
 sVSfoYZ8Wu6lUrvNE+0YhgzC8lOMrWaOIF3F2Vgh1YMxUlLVywVUpCoo4b3faB3+C8hJ
 tMIsXIXv8TSg1NeLBvz1kaeHu6D61By2Cma7idDTdUC0SarmruPll9RjaNxFwtEfgbKu
 VsSQ==
X-Gm-Message-State: AOAM531WDeeaj6m/dUZqpeLWwiuJ8IPtwBKLgCn2tB0A2HSuZIkzFjfT
 9kJAG5JVGF0911JIWbobSy5LyH+xGIUgpXrVGmcJLDOnWq3xgXgvO3lPIRicz8tGqXpEImyljrq
 aK5lfyYez/oIrrKn3zyplrrsCT235OtCd7Sj9WIvjeg==
X-Received: by 2002:a5d:4bc4:: with SMTP id l4mr9855658wrt.97.1594806423950;
 Wed, 15 Jul 2020 02:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHDUVU4AP3hlp5Siz7vKq3EW4crKSR0xnUKkeLjfUiJpc4ShpyJMTGyZWh8XxJyKnOOZ6fMA==
X-Received: by 2002:a5d:4bc4:: with SMTP id l4mr9855634wrt.97.1594806423671;
 Wed, 15 Jul 2020 02:47:03 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id j75sm2897436wrj.22.2020.07.15.02.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 02:47:02 -0700 (PDT)
Date: Wed, 15 Jul 2020 05:46:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH] virtio_balloon: clear modern features under legacy
Message-ID: <20200715053808-mutt-send-email-mst@kernel.org>
References: <20200710113046.421366-1-mst@redhat.com>
 <CAKgT0UeZN+mOWNhgiT0btZTyki3TPoj7pbqA+__GkCxoifPqeg@mail.gmail.com>
 <20200712105926-mutt-send-email-mst@kernel.org>
 <CAKgT0UdY1xpEH1Hg4HWJEkGwH5s64sm1y4O_XmHe8P_f=tDhpg@mail.gmail.com>
 <20200714044017-mutt-send-email-mst@kernel.org>
 <CAKgT0Ud_AFpB-=uCB_3qY8pFvG9Kj7OFSmFG76LZC9K91oUG2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKgT0Ud_AFpB-=uCB_3qY8pFvG9Kj7OFSmFG76LZC9K91oUG2w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
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

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgMTA6MzE6NTZBTSAtMDcwMCwgQWxleGFuZGVyIER1eWNr
IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDE0LCAyMDIwIGF0IDE6NDUgQU0gTWljaGFlbCBTLiBUc2ly
a2luIDxtc3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKdWwgMTMsIDIwMjAg
YXQgMDg6MTA6MTRBTSAtMDcwMCwgQWxleGFuZGVyIER1eWNrIHdyb3RlOgo+ID4gPiBPbiBTdW4s
IEp1bCAxMiwgMjAyMCBhdCA4OjEwIEFNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBKdWwgMTAsIDIwMjAgYXQgMDk6MTM6
NDFBTSAtMDcwMCwgQWxleGFuZGVyIER1eWNrIHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBKdWwg
MTAsIDIwMjAgYXQgNDozMSBBTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPiB3
cm90ZToKPiA+ID4gPiA+ID4KPiAKPiA8c25pcD4KPiAKPiA+ID4gPiBBcyB5b3Ugc2F5IGNvcnJl
Y3RseSB0aGUgY29tbWFuZCBpZCBpcyBhY3R1YWxseSBhc3N1bWVkIG5hdGl2ZSBlbmRpYW46Cj4g
PiA+ID4KPiA+ID4gPgo+ID4gPiA+IHN0YXRpYyB1MzIgdmlydGlvX2JhbGxvb25fY21kX2lkX3Jl
Y2VpdmVkKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIpCj4gPiA+ID4gewo+ID4gPiA+ICAgICAg
ICAgaWYgKHRlc3RfYW5kX2NsZWFyX2JpdChWSVJUSU9fQkFMTE9PTl9DT05GSUdfUkVBRF9DTURf
SUQsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ2Yi0+Y29uZmlnX3Jl
YWRfYml0bWFwKSkKPiA+ID4gPiAgICAgICAgICAgICAgICAgdmlydGlvX2NyZWFkKHZiLT52ZGV2
LCBzdHJ1Y3QgdmlydGlvX2JhbGxvb25fY29uZmlnLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZnJlZV9wYWdlX2hpbnRfY21kX2lkLAo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJnZiLT5jbWRfaWRfcmVjZWl2ZWRfY2FjaGUpOwo+ID4gPiA+Cj4gPiA+
ID4gICAgICAgICByZXR1cm4gdmItPmNtZF9pZF9yZWNlaXZlZF9jYWNoZTsKPiA+ID4gPiB9Cj4g
PiA+ID4KPiA+ID4gPgo+ID4gPiA+IFNvIGd1ZXN0IGFzc3VtZXMgbmF0aXZlLCBob3N0IGFzc3Vt
ZXMgTEUuCj4gPiA+Cj4gPiA+IFRoaXMgd2Fzbid0IGV2ZW4gdGhlIG9uZSBJIHdhcyB0YWxraW5n
IGFib3V0LCBidXQgbm93IHRoYXQgeW91IHBvaW50Cj4gPiA+IGl0IG91dCB0aGlzIGlzIGRlZmlu
YXRlbHkgYnVnLiBUaGUgY29tbWFuZCBJRCBJIHdhcyB0YWxraW5nIGFib3V0IHdhcwo+ID4gPiB0
aGUgb25lIGJlaW5nIHBhc3NlZCB2aWEgdGhlIGRlc2NyaXB0b3IgcmluZy4gVGhhdCBvbmUgSSBi
ZWxpZXZlIGlzCj4gPiA+IG5hdGl2ZSBvbiBib3RoIHNpZGVzLgo+ID4KPiA+IFdlbGwgcWVtdSBz
d2FwcyBpdCBmb3IgbW9kZXJuIGRldmljZXM6Cj4gPgo+ID4gICAgICAgICB2aXJ0aW9fdHN3YXAz
MnModmRldiwgJmlkKTsKPiA+Cj4gPiBndWVzdCBzd2FwcyBpdCB0b286Cj4gPiAgICAgICAgIHZi
LT5jbWRfaWRfYWN0aXZlID0gY3B1X3RvX3ZpcnRpbzMyKHZiLT52ZGV2LAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRpb19iYWxsb29uX2NtZF9pZF9yZWNl
aXZlZCh2YikpOwo+ID4gICAgICAgICBzZ19pbml0X29uZSgmc2csICZ2Yi0+Y21kX2lkX2FjdGl2
ZSwgc2l6ZW9mKHZiLT5jbWRfaWRfYWN0aXZlKSk7Cj4gPiAgICAgICAgIGVyciA9IHZpcnRxdWV1
ZV9hZGRfb3V0YnVmKHZxLCAmc2csIDEsICZ2Yi0+Y21kX2lkX2FjdGl2ZSwgR0ZQX0tFUk5FTCk7
Cj4gPgo+ID4gU28gaXQncyBuYXRpdmUgZm9yIGxlZ2FjeS4KPiAKPiBPa2F5LCB0aGF0IG1ha2Vz
IHNlbnNlLiBJIGp1c3Qgd2Fzbid0IGZhbWlsaWFyIHdpdGggdGhlIHZpcnRpbzMyIHR5cGUuCj4g
Cj4gSSBndWVzcyB0aGF0IGp1c3QgbWVhbnMgd2UgbmVlZCB0byBmaXggdGhlIG9yaWdpbmFsIGlz
c3VlIHlvdSBmb3VuZAo+IHdoZXJlIHRoZSBndWVzdCB3YXMgYXNzdW1pbmcgbmF0aXZlIGZvciB0
aGUgY29tbWFuZCBJRCBpbiB0aGUgY29uZmlnLgo+IERvIHlvdSBwbGFuIHRvIHBhdGNoIHRoYXQg
b3Igc2hvdWxkIEk/CgpJJ2xsIGRvIGl0LgoKCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYyB8
IDkgKysrKysrKysrCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fYmFsbG9vbi5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+ID4gPiA+ID4g
PiBpbmRleCA1ZDRiODkxYmY4NGYuLmI5YmMwMzM0NTE1NyAxMDA2NDQKPiA+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+ID4gPiA+ID4gPiArKysgYi9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4gPiA+ID4gPiA+IEBAIC0xMTA3LDYgKzExMDcs
MTUgQEAgc3RhdGljIGludCB2aXJ0YmFsbG9vbl9yZXN0b3JlKHN0cnVjdCB2aXJ0aW9fZGV2aWNl
ICp2ZGV2KQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgc3RhdGljIGludCB2aXJ0YmFsbG9vbl92
YWxpZGF0ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+ID4gPiA+ID4gIHsKPiA+ID4g
PiA+ID4gKyAgICAgICAvKgo+ID4gPiA+ID4gPiArICAgICAgICAqIExlZ2FjeSBkZXZpY2VzIG5l
dmVyIHNwZWNpZmllZCBob3cgbW9kZXJuIGZlYXR1cmVzIHNob3VsZCBiZWhhdmUuCj4gPiA+ID4g
PiA+ICsgICAgICAgICogRS5nLiB3aGljaCBlbmRpYW4tbmVzcyB0byB1c2U/IEJldHRlciBub3Qg
dG8gYXNzdW1lIGFueXRoaW5nLgo+ID4gPiA+ID4gPiArICAgICAgICAqLwo+ID4gPiA+ID4gPiAr
ICAgICAgIGlmICghdmlydGlvX2hhc19mZWF0dXJlKHZkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkp
IHsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIF9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBW
SVJUSU9fQkFMTE9PTl9GX0ZSRUVfUEFHRV9ISU5UKTsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIF9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBWSVJUSU9fQkFMTE9PTl9GX1BBR0VfUE9JU09O
KTsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIF9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBW
SVJUSU9fQkFMTE9PTl9GX1JFUE9SVElORyk7Cj4gPiA+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+
ID4gPiAgICAgICAgIC8qCj4gPiA+ID4gPiA+ICAgICAgICAgICogSW5mb3JtIHRoZSBoeXBlcnZp
c29yIHRoYXQgb3VyIHBhZ2VzIGFyZSBwb2lzb25lZCBvcgo+ID4gPiA+ID4gPiAgICAgICAgICAq
IGluaXRpYWxpemVkLiBJZiB3ZSBjYW5ub3QgZG8gdGhhdCB0aGVuIHdlIHNob3VsZCBkaXNhYmxl
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIHBhdGNoIGNvbnRlbnQgaXRzZWxmIEkgYW0gZmluZSB3
aXRoIHNpbmNlIG9kZHMgYXJlIG5vYm9keSB3b3VsZAo+ID4gPiA+ID4gZXhwZWN0IHRvIHVzZSB0
aGVzZSBmZWF0dXJlcyB3aXRoIGEgbGVnYWN5IGRldmljZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBB
Y2tlZC1ieTogQWxleGFuZGVyIER1eWNrIDxhbGV4YW5kZXIuaC5kdXlja0BsaW51eC5pbnRlbC5j
b20+Cj4gPiA+ID4KPiA+ID4gPiBIbW0gc28gbm93IHlvdSBwb2ludGVkIG91dCBpdCdzIGp1c3Qg
Y21kIGlkLCBtYXliZSBJIHNob3VsZCBqdXN0IGZpeCBpdAo+ID4gPiA+IGluc3RlYWQ/IHdoYXQg
ZG8geW91IHNheT8KPiA+ID4KPiA+ID4gU28gdGhlIGNvbmZpZyBpc3N1ZXMgYXJlIGJ1Z3MsIGJ1
dCBJIGRvbid0IHRoaW5rIHlvdSBzYXcgdGhlIG9uZSBJIHdhcwo+ID4gPiB0YWxraW5nIGFib3V0
LiBJbiB0aGUgZnVuY3Rpb24gc2VuZF9jbWRfaWRfc3RhcnQgdGhlIGNtZF9pZF9hY3RpdmUKPiA+
ID4gdmFsdWUgd2hpY2ggaXMgaW5pdGlhbGl6ZWQgYXMgYSB2aXJ0aW8zMiBpcyBhZGRlZCBhcyBh
IHNnIGVudHJ5IGFuZAo+ID4gPiB0aGVuIHNlbnQgYXMgYW4gb3V0YnVmIHRvIHRoZSBkZXZpY2Uu
IEknbSBhc3N1bWluZyB2aXJ0aW8zMiBpcyBhIGhvc3QKPiA+ID4gbmF0aXZlIGJ5dGUgb3JkZXJp
bmcuCj4gPgo+ID4gSUlVQyBpdCBpc24ndCA6KSB2aXJ0aW8zMiBpcyBndWVzdCBuYXRpdmUgaWYg
ZGV2aWNlIGlzIGxlZ2FjeSwgYW5kIExFIGlmCj4gPiBkZXZpY2UgaXMgbW9kZXJuLgo+IAo+IE9r
YXkuIFNvIEkgc2hvdWxkIHByb2JhYmx5IGRvY3VtZW50IHRoYXQgZm9yIHRoZSBzcGVjIEkgaGF2
ZSBiZWVuCj4gd29ya2luZyBvbi4gSXQgbG9va3MgbGlrZSB0aGVyZSBpcyBhbiBleGFtcGxlIG9m
IHNpbWlsYXIgZG9jdW1lbnRhdGlvbgo+IGZvciB0aGUgbWVtb3J5IHN0YXRpc3RpY3Mgc28gaXQg
c2hvdWxkIGJlIHByZXR0eSBzdHJhaWdodCBmb3J3YXJkLgo+IAo+IFRoYW5rcy4KPiAKPiAtIEFs
ZXgKCiJndWVzdCBuYXRpdmUgaWYgZGV2aWNlIGlzIGxlZ2FjeSwgYW5kIExFIGlmIGRldmljZSBp
cyBtb2Rlcm4iCmlzIGEgc3RhbmRhcmQgdmlydGlvIHRoaW5nLiBCYWxsb29uIGhhcyBzcGVjaWFs
IGxhbmd1YWdlIHNheWluZwppdHMgY29uZmlnIHNwYWNlIGlzIGFsd2F5cyBMRS4KCgoyLjQuMwoK
TGVnYWN5IEludGVyZmFjZTogQSBOb3RlIG9uIERldmljZSBDb25maWd1cmF0aW9uIFNwYWNlIGVu
ZGlhbi1uZXNzCk5vdGUgdGhhdCBmb3IgbGVnYWN5IGludGVyZmFjZXMsIGRldmljZSBjb25maWd1
cmF0aW9uIHNwYWNlIGlzIGdlbmVyYWxseSB0aGUgZ3Vlc3TigJlzIG5hdGl2ZSBlbmRpYW4sIHJh
dGhlciB0aGFuClBDSeKAmXMgbGl0dGxlLWVuZGlhbi4gVGhlIGNvcnJlY3QgZW5kaWFuLW5lc3Mg
aXMgZG9jdW1lbnRlZCBmb3IgZWFjaCBkZXZpY2UuCgoKVGhpcyBsYW5ndWFnZSBjb3VsZCB1c2Ug
c29tZSB0d2Vha2luZzogZS5nLiAiUENJIiBoZXJlIHJlZmVycyB0byB0aGUgdGltZSB3aGVuClBD
SSB3YXMgdGhlIG9ubHkgdHJhbnNwb3J0LiBBbmQgbW9zdCBkZXZpY2VzIGRvbid0IGRvY3VtZW50
IGVuZGlhbm5lc3MKc28ganVzdCByZWx5IG9uIHN0YW5kYXJkIG9uZS4KCgpTaW1pbGFybHk6Cgoy
LjYuMwoKTGVnYWN5IEludGVyZmFjZXM6IEEgTm90ZSBvbiBWaXJ0cXVldWUgRW5kaWFubmVzcwoK
Tm90ZSB0aGF0IHdoZW4gdXNpbmcgdGhlIGxlZ2FjeSBpbnRlcmZhY2UsIHRyYW5zaXRpb25hbCBk
ZXZpY2VzIGFuZCBkcml2ZXJzIE1VU1QgdXNlIHRoZSBuYXRpdmUgZW5kaWFuIG9mCnRoZSBndWVz
dCBhcyB0aGUgZW5kaWFuIG9mIGZpZWxkcyBhbmQgaW4gdGhlIHZpcnRxdWV1ZS4gVGhpcyBpcyBv
cHBvc2VkIHRvIGxpdHRsZS1lbmRpYW4gZm9yIG5vbi1sZWdhY3kgaW50ZXJmYWNlCmFzIHNwZWNp
ZmllZCBieSB0aGlzIHN0YW5kYXJkLiBJdCBpcyBhc3N1bWVkIHRoYXQgdGhlIGhvc3QgaXMgYWxy
ZWFkeSBhd2FyZSBvZiB0aGUgZ3Vlc3QgZW5kaWFuLgoKCkNvdWxkIHVzZSBzb21lIGxvdmUgdG9v
LCBlLmcuIGhvc3QgLT4gZGV2aWNlLCBndWVzdCAtPiBkcml2ZXIuCgoKCi0tIApNU1QKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
