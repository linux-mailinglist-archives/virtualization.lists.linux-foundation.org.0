Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A9230351
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 08:53:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D85D587D98;
	Tue, 28 Jul 2020 06:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHJ1bq-qVYll; Tue, 28 Jul 2020 06:53:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DF4B87D9E;
	Tue, 28 Jul 2020 06:53:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D5B7C004D;
	Tue, 28 Jul 2020 06:53:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D054AC004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 259C18816A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILuxHJST626b
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:53:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 833F587D98
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595919229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnw4VeSo1K/0ffNbpoNiFUTzDsP0Bj3EuQOAwAS2EM8=;
 b=KkKkU6+JHbHZFgOVXUJvdFth2DKGBU5nZoPaYPQGF0G9F1SR/LzUN8NGWvjrfcxkNYXM47
 O4LTDMZ1yyc141iIzM2JYzUZHoovX8MVAJNIcv5wKD17mosaoDgwvywGnBWwqYueRtZRMO
 Cug/y2jVSwIdJtWcH+CULmd8Id18BDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-otXr4YQpMVuWyZLCGjg-0A-1; Tue, 28 Jul 2020 02:53:45 -0400
X-MC-Unique: otXr4YQpMVuWyZLCGjg-0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD293101C8A9;
 Tue, 28 Jul 2020 06:53:43 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D861860BF4;
 Tue, 28 Jul 2020 06:53:35 +0000 (UTC)
Subject: Re: [PATCH V3 vhost next 00/10] VDPA support for Mellanox ConnectX
 devices
From: Jason Wang <jasowang@redhat.com>
To: Eli Cohen <eli@mellanox.com>
References: <20200728060539.4163-1-eli@mellanox.com>
 <1dbac14a-5909-ff0a-8e90-534847f93d50@redhat.com>
 <20200728063211.GA229972@mtl-vdi-166.wap.labs.mlnx>
 <ef857921-4b9a-8e48-d5cd-5ef585e8f15c@redhat.com>
Message-ID: <83eb3fdc-83d5-7f88-bef4-602e60c19662@redhat.com>
Date: Tue, 28 Jul 2020 14:53:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ef857921-4b9a-8e48-d5cd-5ef585e8f15c@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: shahafs@mellanox.com, parav@mellanox.com, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYgyOjQwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAyMC83
LzI4IOS4i+WNiDI6MzIsIEVsaSBDb2hlbiB3cm90ZToKPj4gT24gVHVlLCBKdWwgMjgsIDIwMjAg
YXQgMDI6MTg6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+IE9uIDIwMjAvNy8yOCDk
uIvljYgyOjA1LCBFbGkgQ29oZW4gd3JvdGU6Cj4+Pj4gSGkgTWljaGFlbCwKPj4+PiBwbGVhc2Ug
bm90ZSB0aGF0IHRoaXMgc2VyaWVzIGRlcGVuZHMgb24gbWx4NSBjb3JlIGRldmljZSBkcml2ZXIg
Cj4+Pj4gcGF0Y2hlcwo+Pj4+IGluIG1seDUtbmV4dCBicmFuY2ggaW4KPj4+PiBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWVsbGFub3gvbGludXguZ2l0Lgo+
Pj4+Cj4+Pj4gZ2l0IHB1bGwgCj4+Pj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L21lbGxhbm94L2xpbnV4LmdpdCAKPj4+PiBtbHg1LW5leHQKPj4+Pgo+Pj4+
IFRoZXkgYWxzbyBkZXBlbmQgSmFzb24gV2FuZydzIHBhdGNoZXMgc3VibWl0dGVkIGEgY291cGxl
IG9mIHdlZWtzIGFnby4KPj4+Pgo+Pj4+IHZkcGFfc2ltOiB1c2UgdGhlIGJhdGNoaW5nIEFQSQo+
Pj4+IHZob3N0LXZkcGE6IHN1cHBvcnQgYmF0Y2ggdXBkYXRpbmcKPj4+Cj4+PiBKdXN0IG5vdGlj
ZSB0aGF0IGEgbmV3IHZlcnNpb24gaXMgcG9zdGVkWzFdICh5b3Ugd2VyZSBjY2VkKS4gVGFsa2Vk
Cj4+PiB3aXRoIE1pY2hhZWwsIGFuZCBpdCdzIGJldHRlciBmb3IgeW91IHRvIG1lcmdlIHRoZSBu
ZXcgdmVyc2lvbiBpbgo+Pj4gdGhpcyBzZXJpZXMuCj4+Pgo+PiBPSywgd2lsbCBzZW5kIGFnYWlu
LiBKdXN0IHRvIG1ha2Ugc3VyZSwgSSBzaG91bGQgcHV0IHlvdXIgc2VyaWVzIGFuZCBteQo+PiBz
ZXJpZXMgb24gTWljaGFsJ3Mgdmhvc3QgYnJhbmNoLCB0aGUgc2FtZSB0cmVlIEkgaGF2ZSBiZWVu
IHVzaW5nIHNvIGZhcj8KPgo+Cj4gWWVzLiBJIHRoaW5rIHNvLgo+Cj4gVGhhbmtzCgoKSnVzdCBu
b3RpY2UgTWljaGFlbCdzIHZob3N0IGJyYW5jaCBjYW4gbm90IGNvbXBpbGUgZHVlIHRvIHRoaXMg
Y29tbWl0OgoKY29tbWl0IGZlZThmZTZiZDhjY2FjZDI3ZTk2M2I3MWI0Zjk0M2JlMzcyMTc3OWUK
QXV0aG9yOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpEYXRlOsKgwqAgTW9u
IEp1bCAyNyAxMDo1MTo1NSAyMDIwIC0wNDAwCgogwqDCoMKgIHZkcGE6IG1ha2Ugc3VyZSBzZXRf
ZmVhdHVyZXMgaW4gaW52b2tlZCBmb3IgbGVnYWN5CgpMZXQncyB3YWl0IGZvciBNaWNoYWVsIHRv
IGNsYXJpZnkgdGhlIGNvcnJlY3QgYnJhbmNoIHRvIHVzZSB0aGVuLgoKVGhhbmtzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
