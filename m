Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D319F92B
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 17:50:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D5C68855F;
	Mon,  6 Apr 2020 15:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w65--Uf4oufH; Mon,  6 Apr 2020 15:50:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D438C88561;
	Mon,  6 Apr 2020 15:50:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7B8EC0177;
	Mon,  6 Apr 2020 15:50:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 086AEC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 02D5D8855F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcEapz4a7c7K
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:50:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5A5FE87DB2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586188236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiVdsmv3/2P/Q7pF5E5kmgygaZDYlx3kJKogFXNLWtA=;
 b=R+/6szKZrLlmavEi1ic8T1i4WC7miRmmBfjBCkx0xRDQFVAHxcmONrgf8vYHHkIBxe1Dhh
 Q4NTefNn8qQWsQCQC6UdAON6bIBipPtzOpREu5UFxb7Eb5h8TwKXpuyUfMcrPSMkg32Xsp
 7L8ieu/c+gY8hv14wWiiAmrb+X2XzVk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-YfwwhQefMEu-4AaF4GbzMg-1; Mon, 06 Apr 2020 11:50:34 -0400
X-MC-Unique: YfwwhQefMEu-4AaF4GbzMg-1
Received: by mail-wr1-f72.google.com with SMTP id a10so20877wra.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 08:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AiVdsmv3/2P/Q7pF5E5kmgygaZDYlx3kJKogFXNLWtA=;
 b=D4/2PKjyN6+jwGAEw4ucFfdgz3dBTrGVa9hPYeDkjbEJrJRAVYwWpPbopG1jNMZHXj
 ndqYu2lGDuNEzahO0kZkcBypf/uH7l8w53b4zQ3uQQ8qaaIXMxPBXwX9L4ZtSUcG7fGk
 Su2pINfk6bN2hkg/ywriYxX96WFgT64wX6pY/7UUzl1E7EP2Cu+LwQZa1mtIYi/mkSU2
 cAdq1qDmmHV2wcBr+09mqn24LDblWqOnOU8fu7kLyaAPEyMuubOUj+W/TuJaQAv3W0BU
 eeLnX5P/qsJk3Ug4/LFtjoFMfgDzeKtLEsjYXTjKHq23zPvcV+pjEtoEh37upMHYurUT
 k9Iw==
X-Gm-Message-State: AGi0PuaEfRRbhH4HiouSlEYrIxlOXOy1zJX9QF0HUhrC9OEMGV09rhj5
 ZCe5i+RgiPDiQKH8HmZ+hgIMHcYzwYmsIoLZ+3nG7xdIgAI1OvzZrqDng+lA8XKm7F97L2s8920
 OlMFDFmtjMjlz1Wkhvg8EoeNSgvPxVYYofpNVB+AKNQ==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr29830wma.162.1586188233611;
 Mon, 06 Apr 2020 08:50:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7Gd3nZkL9uo5+Ou7XIdYwJB7yp+v4e5QytAmqs3y0Z2zBCFk8WkkT0EaCqevxA8KNcArUAA==
X-Received: by 2002:a1c:4346:: with SMTP id q67mr29819wma.162.1586188233457;
 Mon, 06 Apr 2020 08:50:33 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id y33sm12153096wrd.84.2020.04.06.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 08:50:32 -0700 (PDT)
Date: Mon, 6 Apr 2020 11:50:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vdpa-sim: depend on HAS_DMA
Message-ID: <20200406115000-mutt-send-email-mst@kernel.org>
References: <20200405081355.2870-1-mst@redhat.com>
 <20200406130927.GA20291@infradead.org>
 <20200406095931-mutt-send-email-mst@kernel.org>
 <0f4f2502-e810-e87a-2fba-dc887d2f4272@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0f4f2502-e810-e87a-2fba-dc887d2f4272@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBBcHIgMDYsIDIwMjAgYXQgMTA6MTI6NTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvNiDkuIvljYgxMDowMiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gTW9uLCBBcHIgMDYsIDIwMjAgYXQgMDY6MDk6MjdBTSAtMDcwMCwgQ2hyaXN0b3Bo
IEhlbGx3aWcgd3JvdGU6Cj4gPiA+IFBsZWFlIGp1c3QgZHJvcCB0aGUgY29kZSAtIHdlIHNob3Vs
ZCBub3QgYWRkIG5ldyBkcml2ZXJzIHdpdGggY3VzdG9tCj4gPiA+IERNQSBvcHMuCj4gPiBJJ20g
bm90IHN1cmUgdGhlcmUncyBhbm90aGVyIHdheSB0byBkbyB0aGlzOiB0aGlzIG5vdCBhIGRyaXZl
ciwgaXQncyBhCj4gPiBzb2Z0d2FyZSBlbXVsYXRvciB0aGF0IHByZXRlbmRzIHRvIGJlIGFuIGFj
dHVhbCBkZXZpY2UuIFdlIGNhbid0Cj4gPiBoYXZlIHRoZSBwbGF0Zm9ybSBzdXBwbHkgRE1BIG9w
cyBoZXJlIHNpbmNlIHRoZSBwbGF0Zm9ybSBpcyBhIHJlZ3VsYXIKPiA+IHg4NiBvciB3aGF0ZXZl
ci4KPiAKPiAKPiBZZXMsIGFjdHVhbGx5IHZkcGEtc2ltIGRvZXMgbm90IGRlcGVuZHMgb24gSEFT
X0RNQS4gTWF5YmUgd2UgY2FuIGRvIHNob3J0Y3V0Cj4gbGlrZSBkZXYtPmRtYV9vcHMgPSB2ZHBh
c2ltX2RtYV9vcHM7Cj4gCj4gVGhhbmtzCj4gCgpXZSBjYW4gZG8gdGhhdCAtIGRvZXMgaXQgdGhl
bSBhY3R1YWxseSB3b3JrIC0gYW5kIG5vdCBqdXN0IGNvbXBpbGU/CgotLSAKTVNUCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
