Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECA169EC8
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 07:49:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 943D586F21;
	Mon, 24 Feb 2020 06:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebdQ1tIchz+T; Mon, 24 Feb 2020 06:49:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDAF386F3A;
	Mon, 24 Feb 2020 06:49:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F048C0177;
	Mon, 24 Feb 2020 06:49:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84824C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 06:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7B4B58622A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 06:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnIUwQxTmJxa
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 06:49:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BB0DC81D35
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582526952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFrZl6Sw3yEf+caSATqePnmBvtnNQFZ6PQ2MTTPkWY4=;
 b=ZPUPeHm7W7bYUdLzxTLyCr/4UluFXuIVJj3AewnyRmTYQnCzMb2yOIRCyCEAnXam55Gfxh
 J9JAqxZ6BTpOmeurmPNNDpX8KOqZNoaU67nTlKK+k5p5HnTT6qb2qXzPCkqPuVlMqLkMK6
 pxpXLOoFT3779sf3VvExMkMVmiFliOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-2pKoJM5WNTO2krrL8cQnhw-1; Mon, 24 Feb 2020 01:49:10 -0500
X-MC-Unique: 2pKoJM5WNTO2krrL8cQnhw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB5E0800D54;
 Mon, 24 Feb 2020 06:49:07 +0000 (UTC)
Received: from [10.72.13.147] (ovpn-13-147.pek2.redhat.com [10.72.13.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4035A5C21B;
 Mon, 24 Feb 2020 06:48:49 +0000 (UTC)
Subject: Re: [PATCH V4 3/5] vDPA: introduce vDPA bus
To: Harpreet Singh Anand <hanand@xilinx.com>, "mst@redhat.com"
 <mst@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-4-jasowang@redhat.com>
 <BY5PR02MB63714A03B7135F8C4054C1E8BBEC0@BY5PR02MB6371.namprd02.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d6ea5dcb-3933-920b-523e-a494d323ef8a@redhat.com>
Date: Mon, 24 Feb 2020 14:48:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB63714A03B7135F8C4054C1E8BBEC0@BY5PR02MB6371.namprd02.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jiri@mellanox.com" <jiri@mellanox.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "jgg@mellanox.com" <jgg@mellanox.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>
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

Ck9uIDIwMjAvMi8yNCDkuIvljYgyOjE0LCBIYXJwcmVldCBTaW5naCBBbmFuZCB3cm90ZToKPiBJ
cyB0aGVyZSBhIHBsYW4gdG8gYWRkIGFuIEFQSSBpbiB2RFBBX2NvbmZpZ19vcHMgZm9yIGdldHRp
bmcgdGhlIG5vdGlmaWNhdGlvbiBhcmVhIGZyb20gdGhlIFZEUEEgZGV2aWNlIChzb21ldGhpbmcg
c2ltaWxhciB0byBnZXRfbm90aWZ5X2FyZWEgaW4gdGhlIFZEUEEgRFBESyBjYXNlKT8gVGhpcyB3
aWxsIG1ha2UgdGhlIG5vdGlmaWNhdGlvbnMgZnJvbSB0aGUgZ3Vlc3QgICh2aG9zdF92ZHBhIHVz
ZSBjYXNlKSB0byB0aGUgVkRQQSBkZXZpY2UgbW9yZSBlZmZpY2llbnQgLSBhdCBsZWFzdCBmb3Ig
dmlydGlvIDEuMCsgZHJpdmVycyBpbiB0aGUgVk0uCj4KPiBJIGJlbGlldmUgdGhpcyB3b3VsZCBy
ZXF1aXJlIGVuaGFuY2VtZW50IHRvIHRoZSB2aG9zdCBpb2N0bCAoc29tZXRoaW5nIHNpbWlsYXIg
dG8gdGhlICBWSE9TVF9VU0VSX1NMQVZFX1ZSSU5HX0hPU1RfTk9USUZJRVJfTVNHKS4KCgpZZXMs
IHdlIHBsYW4gdG8gYWRkIHRoYXQgb24gdG9wLiBCYXNpY2FsbHksIGhlcmUncyB3aGF0IHdlIHBs
YW4gdG8gZG86IAooc29ydGVkIGJ5IHVyZ2VuY3kpCgoxKSBkaXJlY3QgZG9vcmJlbGwgbWFwcGlu
ZyBhcyB5b3UgYXNrZWQgaGVyZQoyKSBkaXJlY3QgaW50ZXJydXB0IGluamVjdGlvbiAod2hlbiBw
bGF0Zm9ybSBzdXBwb3J0LCBlLmcgdGhyb3VnaCBwb3N0ZWQgCmludGVycnVwdCkKMykgY29udHJv
bCB2aXJ0cXVldWUgc3VwcG9ydAoKVGhhbmtzCgoKPgo+Cj4gUmVnYXJkcywKPiBIYXJwcmVldAo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
