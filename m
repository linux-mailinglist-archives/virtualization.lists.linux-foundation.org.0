Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35919F7B2
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 16:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2CCA87E3E;
	Mon,  6 Apr 2020 14:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MImM7VTU0Dq0; Mon,  6 Apr 2020 14:13:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 44499860A8;
	Mon,  6 Apr 2020 14:13:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 222F0C0177;
	Mon,  6 Apr 2020 14:13:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D6CAC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 733FC880D9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exHXgQohGdZ2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:13:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF90C884FB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586182385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2MelgTXjhlw+4fjd+9b4cGKMxMyBiqW0h/JEEsI35s=;
 b=iGZnWfHzR9gBsbpjJTbsmdkNioTcmGazOgNkxM8HCr3Ez9I3/QGRu7RAgP8Aq41hG4+w8W
 BfbEuvDLq5GG/h1TDegysLqB4ycY0nO+aE3LTTpe7+9nUBDegPkpTmjwamQrB1YYPZw2AY
 1cCZ2uzg2/Tx2qK90EOhz0CGc75V5yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-RKD7ZMzPMS2c2KNW3jdqbQ-1; Mon, 06 Apr 2020 10:13:03 -0400
X-MC-Unique: RKD7ZMzPMS2c2KNW3jdqbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83201935780;
 Mon,  6 Apr 2020 14:13:02 +0000 (UTC)
Received: from [10.72.12.191] (ovpn-12-191.pek2.redhat.com [10.72.12.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 937DD2637B;
 Mon,  6 Apr 2020 14:12:58 +0000 (UTC)
Subject: Re: [PATCH] vdpa-sim: depend on HAS_DMA
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Christoph Hellwig <hch@infradead.org>
References: <20200405081355.2870-1-mst@redhat.com>
 <20200406130927.GA20291@infradead.org>
 <20200406095931-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0f4f2502-e810-e87a-2fba-dc887d2f4272@redhat.com>
Date: Mon, 6 Apr 2020 22:12:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406095931-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNC82IOS4i+WNiDEwOjAyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBBcHIgMDYsIDIwMjAgYXQgMDY6MDk6MjdBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6Cj4+IFBsZWFlIGp1c3QgZHJvcCB0aGUgY29kZSAtIHdlIHNob3VsZCBub3QgYWRkIG5l
dyBkcml2ZXJzIHdpdGggY3VzdG9tCj4+IERNQSBvcHMuCj4gSSdtIG5vdCBzdXJlIHRoZXJlJ3Mg
YW5vdGhlciB3YXkgdG8gZG8gdGhpczogdGhpcyBub3QgYSBkcml2ZXIsIGl0J3MgYQo+IHNvZnR3
YXJlIGVtdWxhdG9yIHRoYXQgcHJldGVuZHMgdG8gYmUgYW4gYWN0dWFsIGRldmljZS4gV2UgY2Fu
J3QKPiBoYXZlIHRoZSBwbGF0Zm9ybSBzdXBwbHkgRE1BIG9wcyBoZXJlIHNpbmNlIHRoZSBwbGF0
Zm9ybSBpcyBhIHJlZ3VsYXIKPiB4ODYgb3Igd2hhdGV2ZXIuCgoKWWVzLCBhY3R1YWxseSB2ZHBh
LXNpbSBkb2VzIG5vdCBkZXBlbmRzIG9uIEhBU19ETUEuIE1heWJlIHdlIGNhbiBkbyAKc2hvcnRj
dXQgbGlrZSBkZXYtPmRtYV9vcHMgPSB2ZHBhc2ltX2RtYV9vcHM7CgpUaGFua3MKCgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
