Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C987216795
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 09:40:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D46EE279C9;
	Tue,  7 Jul 2020 07:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kcljKh9W8Gk; Tue,  7 Jul 2020 07:40:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5778927A45;
	Tue,  7 Jul 2020 07:40:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22710C016F;
	Tue,  7 Jul 2020 07:40:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FA4AC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8F929897E1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afD67ZhK2Yat
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:40:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C64F8897CB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 07:40:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f139so45422429wmf.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 00:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mkLi5/2cSGgCl/orCCI+WQ6ij4dPXxM5S2mGX3t0dbo=;
 b=mKYssKYfnJQshvS1XrBtlF9Gm013weN0aYo6leDXZJrX281Jkmlugq67a+QBm6j+Xl
 IQC9EaeXgUrxoeb/BYHTYeTr7z5DSasTPUI5F7wqaQ82C1SJ5LwhHgp4JsWIzHAnU9tW
 zx/fscxw0x8Ag2EIlEmNqGf/Ff8X+XeQcwps7yqio6jF6Ats7nm2k8Swng7gC3Z2j+3B
 cfn3QHModG/WRay8DKMhi3bh5Ez3hZXGRsbmEMRFAWs3y8w+X3b/w5LoXmnYqARi72Jm
 BEh/kisAw2VS/svDG7ASmWFjgT0bPiPRwCpgqDjpHhEUlx+B/NOSlMAqkiywcR1stBHo
 xgVw==
X-Gm-Message-State: AOAM5319I688SW4eS+TfpDfAFtwcYu8PDk7N85mcX0hr83vDJpwMcu3s
 FVYqXEFOWH/GTDOeLeLsw5Q=
X-Google-Smtp-Source: ABdhPJxZJEUdcW0X69/BdwNsvMtSqC0D3HaxiNuMfjIEkWNL/6j1aTh84oerAukVLXiZeh7bk3rWtA==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr2639851wmn.167.1594107638192; 
 Tue, 07 Jul 2020 00:40:38 -0700 (PDT)
Received: from localhost (ip-37-188-179-51.eurotel.cz. [37.188.179.51])
 by smtp.gmail.com with ESMTPSA id e23sm2189282wme.35.2020.07.07.00.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:40:37 -0700 (PDT)
Date: Tue, 7 Jul 2020 09:40:36 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Colm =?iso-8859-1?Q?MacC=E1rthaigh?= <colmmacc@amazon.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
Message-ID: <20200707074036.GB3820@dhcp22.suse.cz>
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
 <20200703113026.GT18446@dhcp22.suse.cz>
 <BC9E44B2-D3C2-43C7-8F4B-A31477147368@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BC9E44B2-D3C2-43C7-8F4B-A31477147368@amazon.com>
Cc: fweimer@redhat.com, len.brown@intel.com, bonzini@gnu.org, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, wad@chromium.org, keescook@chromium.org,
 linux-pm@vger.kernel.org, linux-api@vger.kernel.org, "Brooker,
 Marc" <mbrooker@amazon.com>, rjw@rjwysocki.net,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, "Weiss, Radu" <raduweis@amazon.com>,
 pavel@ucw.cz, "Sandu, Andrei" <sandreim@amazon.com>, akpm@linux-foundation.org,
 luto@amacapital.net, "Singh, Balbir" <sblbir@amazon.com>, mingo@kernel.org,
 "Manwaring, Derek" <derekmn@amazon.com>
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

T24gRnJpIDAzLTA3LTIwIDE4OjQ1OjA2LCBDb2xtIE1hY0PDoXJ0aGFpZ2ggd3JvdGU6Cj4gCj4g
Cj4gT24gMyBKdWwgMjAyMCwgYXQgNDozMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+IAo+ID4gT24g
RnJpIDAzLTA3LTIwIDEwOjM0OjA5LCBDYXRhbmdpdSwgQWRyaWFuIENvc3RpbiB3cm90ZToKPiA+
ID4gVGhpcyBwYXRjaCBhZGRzIGxvZ2ljIHRvIHRoZSBrZXJuZWwgcG93ZXIgY29kZSB0byB6ZXJv
IG91dCBjb250ZW50cwo+ID4gPiBvZgo+ID4gPiBhbGwgTUFEVl9XSVBFT05TVVNQRU5EIFZNQXMg
cHJlc2VudCBpbiB0aGUgc3lzdGVtIGR1cmluZyBpdHMKPiA+ID4gdHJhbnNpdGlvbgo+ID4gPiB0
byBhbnkgc3VzcGVuZCBzdGF0ZSBlcXVhbCBvciBncmVhdGVyL2RlZXBlciB0aGFuIFN1c3BlbmQt
dG8tbWVtb3J5LAo+ID4gPiBrbm93biBhcyBTMy4KPiA+IAo+ID4gSG93IGRvZXMgdGhlIGFwcGxp
Y2F0aW9uIGxlYXJuIHRoYXQgaXRzIG1lbW9yeSBnb3Qgd2lwZWQ/IFMyZGlzayBpcyBhbgo+ID4g
YXN5bmMgb3BlcmF0aW9uIGFuZCBpdCBjYW4gaGFwcGVuIGF0IGFueSB0aW1lIGR1cmluZyB0aGUg
dGFzayBleGVjdXRpb24uCj4gPiBTbyBob3cgZG9lcyB0aGUgYXBwbGljYXRpb24gd29yayB0byBw
cmV2ZW50IGZyb20gY29ycnVwdGVkIHN0YXRlIC0gZS5nLgo+ID4gd2hlbiBzdXNwZW5kZWQgYmV0
d2VlbiB0d28gbWVtb3J5IGxvYWRzPwo+IAo+IFRoZSB1c3VhbCB0cmljayB3aGVuIHVzaW5nIE1B
RFZfV0lQRU9ORk9SSywgb3IgQlNE4oCZcyBNQVBfSU5IRVJJVF9aRVJPLCBpcyB0bwo+IHN0b3Jl
IGEgZ3VhcmQgdmFyaWFibGUgaW4gdGhlIHBhZ2UgYW5kIHRvIGNoZWNrIHRoZSB2YXJpYWJsZSBh
bnkgdGltZSB0aGF0Cj4gcmFuZG9tIGRhdGEgaXMgZ2VuZXJhdGVkLgoKV2VsbCwgTUFEVl9XSVBF
T05GT1JLIGlzIGEgY29tcGxldGVseSBkaWZmZXJlbnQgYmVhc3QgYmVjYXVzZSB0aGUKZm9ya2lu
ZyBpcyB1bmRlciBhIGZ1bGwgY29udHJvbCBvZiB0aGUgcGFyZW50IHByb2Nlc3MgYW5kIHRoZQpp
bmZvcm1hdGlvbiBhYm91dCB0aGUgZm9yayBjYW4gYmUgZm9yd2FyZGVkIHRvIGNoaWxkIHByb2Nl
c3MuIEl0IGlzCm5vdCBsaWtlIHRoZSBjaGlsZCB3b3VsZCByZWJvcm4gaW50byBhIG5ldyB3b3Js
ZCBpbiB0aGUgbWlkZGxlIG9mIHRoZQpleGVjdXRpb24uCgotLSAKTWljaGFsIEhvY2tvClNVU0Ug
TGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
