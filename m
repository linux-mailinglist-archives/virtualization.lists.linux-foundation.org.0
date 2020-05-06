Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FEF1C7B4E
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 22:32:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41FB6893EF;
	Wed,  6 May 2020 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGN3Xi+vqxNh; Wed,  6 May 2020 20:32:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32CBC893E9;
	Wed,  6 May 2020 20:32:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02FD9C0859;
	Wed,  6 May 2020 20:32:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 811CAC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6EDE0882BE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7OemAqnBY523
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:32:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0BC4D87482
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588797155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIas5prI6w1WRSg6nm7SW7e8plchGeCXy86KkPBygTU=;
 b=bg7yZLiQfuUlZQ+fQrIuV4ZGAEz3pueoMnRGPe0HhDf6K0i4jxZHEIiJVG+zYfR+Jdt4qK
 4tR9BiMP758LsD5PCQ/lDuTtwTpbSuNkGtlvhBvUSaQTIMXFBwFEfgWJ36I/cXNVGRy6tA
 SsG48vi7/Z6NHfWCgc/6O/w2ByqoJZ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-UBlCUgUDOYa8Dvqj0kBMRg-1; Wed, 06 May 2020 16:32:34 -0400
X-MC-Unique: UBlCUgUDOYa8Dvqj0kBMRg-1
Received: by mail-wr1-f70.google.com with SMTP id 30so1919444wrq.15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 13:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=1VXIoJyVGTqnv0xmGyjiKd0uopuusoRfelVhVxRM1M0=;
 b=QxParjYCNW7b14GxDXeU85D7GPdQISFpSv4ySSoXgmJMPg8/scvxVBzm67Ga/dqOk0
 mKCtYjICUANpWoqKNu55LmxPS/OxNTYPA2b/b1q/GYcR9JBQNxWujGypz+xkEv7335xh
 VV4WAGA2NwdYo4x7DQ1+pt3j5vekYvrx6hnvykdYMwo7Y1tlRAvj45DRUtLP/6jt72J8
 hBSnd07wlm46xklfZOYSFqYMEVXDSthE3m3eo4QG8VMeOwwFs88MhQR/wE7fd2eOH8iL
 ZgERkh/tpL3Op9e6dprd1YWSGljNWQdyXPJivao4Ukh3M9ludplUyz1+EPk1JUGwQeJh
 U9sA==
X-Gm-Message-State: AGi0PuYYqXOZ0w4dmfLXWBHaULe7N+iCCAtrOtXt3edjo04TEcGBf2n+
 p8QBqU/q6uNpQwG2lTd+0if+rYIgK9xAY00AXPM3UncH9GkDiX2ubUCAyE6X4zhHZlRgvCwqReW
 DCTkk1f/QkyA63ODecJloTl4cOz8RKBgbZkH91aU89w==
X-Received: by 2002:a1c:1985:: with SMTP id 127mr6863943wmz.13.1588797153239; 
 Wed, 06 May 2020 13:32:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJv7PfYup3I6WYvehP//5E0f+r/yzOVi/hf1AH4YTqq+ORSfr5YBr27by97VoXD8zbqpFHwKQ==
X-Received: by 2002:a1c:1985:: with SMTP id 127mr6863918wmz.13.1588797152983; 
 Wed, 06 May 2020 13:32:32 -0700 (PDT)
Received: from [192.168.3.122] (p5B0C679D.dip0.t-ipconnect.de. [91.12.103.157])
 by smtp.gmail.com with ESMTPSA id i25sm4449561wml.43.2020.05.06.13.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 13:32:32 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error:
 implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Date: Wed, 6 May 2020 22:32:31 +0200
Message-Id: <37C99432-6290-4130-B0AF-953DDE09D5DC@redhat.com>
References: <20200506162751-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200506162751-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: iPhone Mail (17D50)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, kvm@vger.kernel.org, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Cgo+IEFtIDA2LjA1LjIwMjAgdW0gMjI6Mjggc2NocmllYiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjoKPiAKPiDvu79PbiBUdWUsIE1heSAwNSwgMjAyMCBhdCAwNjoyMjo1MVBN
ICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+IE9uIDA1LjA1LjIwIDE4OjIwLCBN
aWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBPbiBUdWUsIE1heSAwNSwgMjAyMCBhdCAwNTo0
Njo0NFBNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+PiBPbiAwNS4wNS4yMCAx
Nzo0NCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+PiBPbiBUdWUsIE1heSAwNSwgMjAy
MCBhdCAwNDo1MDoxM1BNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pj4+IE9u
IDA1LjA1LjIwIDE2OjE1LCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToKPj4+Pj4+PiB0cmVlOiAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9z
dC5naXQgdmhvc3QKPj4+Pj4+PiBoZWFkOiAgIGRhMTc0Mjc5MWQ4YzBjMGE4ZTU0NzFmMTgxNTQ5
YzQ3MjZhNWM1ZjkKPj4+Pj4+PiBjb21taXQ6IDc1Mjc2MzFlOTAwZDQ2NGVkMmQ1MzNmNzk5Y2Iw
ZGEyYjI5Y2M2ZjAgWzgvMjJdIHZpcnRpby1tZW06IFBhcmF2aXJ0dWFsaXplZCBtZW1vcnkgaG90
cGx1Zwo+Pj4+Pj4+IGNvbmZpZzogeDg2XzY0LXJhbmRjb25maWctYjAwMi0yMDIwMDUwNSAoYXR0
YWNoZWQgYXMgLmNvbmZpZykKPj4+Pj4+PiBjb21waWxlcjogZ2NjLTcgKFVidW50dSA3LjUuMC02
dWJ1bnR1MikgNy41LjAKPj4+Pj4+PiByZXByb2R1Y2U6Cj4+Pj4+Pj4gICAgICAgIGdpdCBjaGVj
a291dCA3NTI3NjMxZTkwMGQ0NjRlZDJkNTMzZjc5OWNiMGRhMmIyOWNjNmYwCj4+Pj4+Pj4gICAg
ICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVlCj4+Pj4+
Pj4gICAgICAgIG1ha2UgQVJDSD14ODZfNjQgCj4+Pj4+Pj4gCj4+Pj4+Pj4gSWYgeW91IGZpeCB0
aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZQo+Pj4+Pj4+
IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4+Pj4+PiAK
Pj4+Pj4+PiBBbGwgZXJyb3Ivd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPj4+
Pj4+PiAKPj4+Pj4+PiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tZW0uYzogSW4gZnVuY3Rpb24g
J3ZpcnRpb19tZW1fcHJvYmUnOgo+Pj4+Pj4+Pj4gZHJpdmVycy92aXJ0aW8vdmlydGlvX21lbS5j
OjEzNzU6MjA6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAna3phbGxv
Yyc7IGRpZCB5b3UgbWVhbiAndnphbGxvYyc/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRl
Y2xhcmF0aW9uXQo+Pj4+Pj4+ICAgICB2ZGV2LT5wcml2ID0gdm0gPSBremFsbG9jKHNpemVvZigq
dm0pLCBHRlBfS0VSTkVMKTsKPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgo+
Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICB2emFsbG9jCj4+Pj4+Pj4+PiBkcml2ZXJzL3Zp
cnRpby92aXJ0aW9fbWVtLmM6MTM3NToxODogd2FybmluZzogYXNzaWdubWVudCBtYWtlcyBwb2lu
dGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KPj4+Pj4+
PiAgICAgdmRldi0+cHJpdiA9IHZtID0ga3phbGxvYyhzaXplb2YoKnZtKSwgR0ZQX0tFUk5FTCk7
Cj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBeCj4+Pj4+Pj4+PiBkcml2ZXJzL3ZpcnRpby92
aXJ0aW9fbWVtLmM6MTQxOToyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24gJ2tmcmVlJzsgZGlkIHlvdSBtZWFuICd2ZnJlZSc/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQo+Pj4+Pj4+ICAgICBrZnJlZSh2bSk7Cj4+Pj4+Pj4gICAgIF5+fn5+
Cj4+Pj4+Pj4gICAgIHZmcmVlCj4+Pj4+Pj4gICBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJl
YXRlZCBhcyBlcnJvcnMKPj4+Pj4+PiAKPj4+Pj4+PiB2aW0gKzEzNzUgZHJpdmVycy92aXJ0aW8v
dmlydGlvX21lbS5jCj4+Pj4+PiAKPj4+Pj4+IEd1ZXNzIHdlIHNpbXBseSBuZWVkCj4+Pj4+PiAK
Pj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4+Pj4+PiAKPj4+Pj4+IHRvIG1ha2UgaXQg
d29yayBmb3IgdGhhdCBjb25maWcuCj4+Pj4+IAo+Pj4+PiAKPj4+Pj4gT0sgSSBhZGRlZCB0aGF0
IGluIHRoZSAxc3QgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB2aXJ0aW8tbWVtLgo+Pj4+IAo+Pj4+
IFRoYW5rcy4gSSBoYXZlIHNvbWUgYWRkb24tcGF0Y2hlcyByZWFkeSwgd2hhdCdzIHRoZSBiZXN0
IHdheSB0byBjb250aW51ZQo+Pj4+IHdpdGggdGhlc2U/Cj4+PiAKPj4+IElmIHRoZXNlIGFyZSBi
dWdmaXhlcywganVzdCByZXNwaW4gdGhlIHNlcmllcyAoaW5jbHVkaW5nIHRoaXMgZml4KS4KPj4g
Cj4+IFRoZXJlIGFyZSB0d28gcmVhbGx5IG1pbm9yIGJ1Z2ZpeGVzIGZvciBjb3JuZXItY2FzZSBl
cnJvciBoYW5kbGluZyBhbmQKPj4gb25lIHNpbXBsaWZpY2F0aW9uLiBJIGNhbiBzcXVhc2ggdGhl
bSBhbmQgcmVzZW5kLCBtYWtlcyB0aGluZ3MgZWFzaWVyLgo+IAo+IE9LIHRyeSB0byBkbyBpdCBB
U0FQLCB3ZSBkb24ndCB3YW50IHRvIHJlcGVhdCB0aGUgZHJhbWEgd2UgaGFkIHdpdGggdmRwYS4K
PiAKClllYWgsIGRpZCBzb21lIG1vcmUgdGVzdGluZyB0b2RheS4gV2lsbCBzZW5kIHYzIG91dCB0
b21vcnJvdy4KCkNoZWVycyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
