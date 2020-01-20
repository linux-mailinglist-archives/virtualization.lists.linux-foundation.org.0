Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC01424E4
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 09:19:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E10BB87020;
	Mon, 20 Jan 2020 08:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnNI+eR-GOby; Mon, 20 Jan 2020 08:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83D168702D;
	Mon, 20 Jan 2020 08:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6516EC0174;
	Mon, 20 Jan 2020 08:19:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C51AC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EBF188702D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iF2MTgPiYH8r
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:19:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5E3B987020
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579508379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEiSgvaAAQAeTsd3Se/ZuFf+OWr2upYmR4dY+/WXBIE=;
 b=ibL7D0nYBdVAuzgQi1hQ4cGrzNLdMMOedSTC7t+QjxuXTyUh3aPc/std25xZPaGIVNqn6T
 Lc2YbpBakfLwSdIu1X1yH7lMsEPV5HTRRFKzIBE+Lr/AlpQT2tQhTagCxhd6oi0csFDWl1
 sYha7TiRS13k8k+z1EhpjfL6P40Zn/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-P8KSRlF4PzGBmy91vGOhqQ-1; Mon, 20 Jan 2020 03:19:38 -0500
X-MC-Unique: P8KSRlF4PzGBmy91vGOhqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E91FADB60;
 Mon, 20 Jan 2020 08:19:34 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 071CE2857A;
 Mon, 20 Jan 2020 08:19:11 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Rob Miller <rob.miller@broadcom.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a4573aa4-f0d6-bb7d-763a-96352fc2c86e@redhat.com>
Date: Mon, 20 Jan 2020 16:19:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: jakub.kicinski@netronome.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, mhabets@solarflare.com,
 haotian.wang@sifive.com, virtualization@lists.linux-foundation.org,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 Jason Gunthorpe <jgg@mellanox.com>, shahafs@mellanox.com,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, stefanha@redhat.com, "Wang,
 Zhihong" <zhihong.wang@intel.com>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMDoxMiwgUm9iIE1pbGxlciB3cm90ZToKPgo+Cj4gICAgID4+
ICsgKiBAZ2V0X3ZlbmRvcl9pZDrCoCDCoCDCoCDCoCDCoCBHZXQgaWQgZm9yIHRoZSB2ZW5kb3Ig
dGhhdAo+ICAgICBwcm92aWRlcyB0aGlzIGRldmljZQo+ICAgICA+PiArICrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAdmRldjogdmRwYSBkZXZpY2UKPiAgICAgPj4gKyAq
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgUmV0dXJucyB1MzI6IHZpcnRp
byB2ZW5kb3IgaWQKPiAgICAgPiB3aGF0J3MgdGhlIGlkZWEgYmVoaW5kIHRoaXM/IHVzZXJzcGFj
ZSBub3JtYWxseSBkb2Vzbid0IGludGVyYWN0Cj4gICAgIHdpdGgKPiAgICAgPiB0aGlzIC4uLiBk
ZWJ1Z2dpbmc/Cj4KPgo+ICAgICBUaGlzIGFsbG93cyBzb21lIHZlbmRvciBzcGVjaWZpYyBkcml2
ZXIgb24gdG9wIG9mIHZEUEEgYnVzLiBJZgo+ICAgICB0aGlzIGlzCj4gICAgIG5vdCBpbnRlcmVz
dGVkLCBJIGNhbiBkcm9wIHRoaXMuCj4KPiBSSk0+XSB3b3VsZG4ndMKgIHVzYWdlIG9mIGdldF9k
ZXZpY2VfaWQgJiBnZXRfdmVuZG9yX2lkLCBiZXlvbmQgCj4gcmVwb3J0aW5nLCB0ZW5kIHRvIHBv
c3NpYmx5IGxlYWRpbmcgdG8gdmVuZG9yIHNwZWNpZmljIGNvZGUgaW4gdGhlIAo+IGZyYW1ld29y
ayBpbnN0ZWFkIG9mIGxlYXZpbmcgdGhlIGZyYW1ld29ya8KgYWdub3N0aWMgYW5kIGxlYXZlIHRo
ZSAKPiB2ZW5kb3Igc3BlY2lmaWMgc3R1ZmYgdG8gdGhlIHZlbmRvcidzIHZEUEEgZGV2aWNlIGRy
aXZlcj8KCgpGb3IgdmlydGlvIGRldmljZSBpZCwgSSB0aGluayBpdCBpcyBuZWVkZWQgZm9yIGtl
cm5lbC91c2Vyc3BhY2UgdG8ga25vdyAKd2hpY2ggZHJpdmVyIHRvIGxvYWQgKGUuZyBsb2FkaW5n
IHZpcnRpby1uZXQgZm9yIG5ldHdvcmtpbmcgZGV2aWMpLgoKRm9yIHZpcnRpbyB2ZW5kb3IgaWQs
IGl0IHdhcyBuZWVkZWQgYnkga2VybmVsIHZpcnRpbyBkcml2ZXIsIGFuZCB2aXJ0aW8gCmJ1cyBj
YW4gbWF0Y2ggZHJpdmVyIGJhc2VkIG9uIHZpcnRpbyB2ZW5kb3IgaWQuIFNvIGl0IGRvZXNuJ3Qg
cHJldmVudCAKM3JkIHZlbmRvciBzcGVjaWZpYyBkcml2ZXIgZm9yIHZpcnRpbyBkZXZpY2UuCgpN
YXliZSB3ZSBjYW4gcmVwb3J0IFZJUlRJT19ERVZfQU5ZX0lEIGFzIHZlbmRvciBpZCB0byBmb3Ji
aWQgdmVuZG9yIApzcGVjaWZpYyBzdHVmZnMuCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
