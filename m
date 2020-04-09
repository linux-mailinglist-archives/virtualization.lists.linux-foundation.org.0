Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B01A2F16
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 08:21:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED481877B5;
	Thu,  9 Apr 2020 06:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PR9taJP5iAeW; Thu,  9 Apr 2020 06:21:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7645F877E2;
	Thu,  9 Apr 2020 06:21:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58FEBC0177;
	Thu,  9 Apr 2020 06:21:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5195C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 06:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 95D072033B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 06:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xelDCcX6Mk-Z
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 06:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 663A320027
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 06:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586413276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mB7SP/Y8MXrZQ6SPWB8nv21X1ADlrVhI+qwnI43BNs=;
 b=VWGHBLjRDRWzQDf9QZUSUnwnjuA2S1layI3moKIEjGlRQuC6XvUVmRtz/rO86Da+rSdd3N
 fVvuR4cTnoQcwTIfCGDWCVPMosU9c0FAM2EnRjsXHcKFTyFYQICkkePJdpsZX2ejPfis5q
 FD5WcpJ1Y/kPdFoh48xWCCn4wvydR8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-4PB6D7EUPkmm0VMYoI55sA-1; Thu, 09 Apr 2020 02:21:10 -0400
X-MC-Unique: 4PB6D7EUPkmm0VMYoI55sA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BA3A107B7D4;
 Thu,  9 Apr 2020 06:21:08 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B42960C18;
 Thu,  9 Apr 2020 06:20:39 +0000 (UTC)
Subject: Re: virtio-mmio: Delete an error message in vm_find_vqs()
To: Markus Elfring <Markus.Elfring@web.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <9e27bc4a-cfa1-7818-dc25-8ad308816b30@web.de>
 <03b19e72-0021-dc6b-77c4-ed3c4e13d526@redhat.com>
 <96031fc7-dced-95bd-fc57-a5fe890638f4@web.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6c94db13-ae46-cf8e-f3c4-6f270112ad87@redhat.com>
Date: Thu, 9 Apr 2020 14:20:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <96031fc7-dced-95bd-fc57-a5fe890638f4@web.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Rob Herring <robh@kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Stephen Boyd <swboyd@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC85IOS4i+WNiDI6MDIsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+Pj4gVGhlIGZ1
bmN0aW9uIOKAnHBsYXRmb3JtX2dldF9pcnHigJ0gY2FuIGxvZyBhbiBlcnJvciBhbHJlYWR5Lgo+
Pj4gVGh1cyBvbWl0IGEgcmVkdW5kYW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxp
bmcgaW4gdGhlCj4+PiBjYWxsaW5nIGZ1bmN0aW9uLgo+PiBJdCBsb29rcyB0byBtZSB0aGF0IG5v
dCBhbGwgZXJyb3IgcGF0aCBvZiBwbGF0Zm9ybV9nZXRfaXJxKCkgd2VyZSBsb2dnZC4KPiBIb3cg
ZG8geW91IHRoaW5rIGFib3V0IHRvIGNsYXJpZnkgdGhlIGhhbmRsaW5nIG9mIHRoZSBlcnJvciBj
b2RlIOKAnC1FUFJPQkVfREVGRVLigJ0gYW55IG1vcmU/Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjUuNi4zL3NvdXJjZS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyNMMjAyCgoK
QWhhLCBpdCBsb29rcyB0byBtZSB0aGF0IEknbSBvbiB0aGUgd3JvbmcgYnJhbmNoLiBTb3JyeS4K
Cgo+Cj4KPj4gQW5kIGdpdCBncmVwIHRvbGQgbWUgdGhlcmUncmUgb3RoZXIgdXNlcnMgb2YgcGxh
dGZvcm1fZ2V0X2lycSgpIHRoYXQgY2hlY2sgYW5kIGxvZyBieSB0aGVtc2VsdmVzLgo+IFNvdXJj
ZSBjb2RlIGFuYWx5c2lzIGNhbiBwb2ludCBmdXJ0aGVyIHVwZGF0ZSBjYW5kaWRhdGVzIG91dCwg
Y2FuJ3QgaXQ/Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYz9pZD03
NzIzZjRjNWVjZGI4ZDgzMmYwNDlmODQ4M2JlYjBkMTA4MWNlZGY2CgoKWWVzLCBpdCBjYW4uCgoK
Pgo+IFdvdWxkIHlvdSBsaWtlIHRvIGFjaGlldmUgY29sbGF0ZXJhbCBldm9sdXRpb24/CgoKWWVz
IGFuZCBpdCdzIHByb2JhYmx5IGJlIGJldHRlciB0byBwdXQgYWxsIHRoZSBmaXhlcyBpbiBvbmUg
c2VyaWVzLgoKRm9yIHRoaXMgcGF0Y2guCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4KClRoYW5rcwoKCj4KPiBSZWdhcmRzLAo+IE1hcmt1cwo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
