Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A14221DD3
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 10:06:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D73C8AED6;
	Thu, 16 Jul 2020 08:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlA0YK608ZCi; Thu, 16 Jul 2020 08:06:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93D9D8AEFE;
	Thu, 16 Jul 2020 08:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C85FC0733;
	Thu, 16 Jul 2020 08:06:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0811AC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E3258226D4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GK2eCB3LUmrn
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:06:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 851302045B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594886802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5dhBqOnsrkp+ck3vhLEOg3slEAzg8AwB2Xf50MijXU=;
 b=LzixM7Ban85m/qfhnWhPTikCvFtJQttjJp61qrjOMHL+A0oNleCHNGmRR7RhGDqCaikUf3
 DkrEE2t2fcETvuCM474S64IUiollxRg9Kdqe/OLdJrg28BXR3zdToN4v6qcli/LXKeAUq1
 COfsQqxsPfqTMgc/MyOuJmbmRpIY7cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Asf4430XNjmlKVUWtpP1mw-1; Thu, 16 Jul 2020 04:06:40 -0400
X-MC-Unique: Asf4430XNjmlKVUWtpP1mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD0B800FF1;
 Thu, 16 Jul 2020 08:06:38 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD9302DE69;
 Thu, 16 Jul 2020 08:06:25 +0000 (UTC)
Subject: Re: [PATCH 0/7] *** IRQ offloading for vDPA ***
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
 <70244d80-08a4-da91-3226-7bfd2019467e@redhat.com>
 <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
 <77318609-85ef-f169-2a1e-500473976d84@redhat.com>
 <29ab6da8-ed8e-6b91-d658-f3d240543b29@intel.com>
 <1e91d9dd-d787-beff-2c14-9c76ffc3b285@redhat.com>
 <a319cba3-8b3d-8968-0fb7-48a1d34042bf@intel.com>
 <67c4c41d-9e95-2270-4acb-6f04668c34fa@redhat.com>
 <20200716021435-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <918ef7c7-852e-6c0a-ed0d-fac3fa6752e4@redhat.com>
Date: Thu, 16 Jul 2020 16:06:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716021435-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: wanpengli@tencent.com, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 sean.j.christopherson@intel.com,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, pbonzini@redhat.com, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvNy8xNiDkuIvljYgyOjE1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBKdWwgMTYsIDIwMjAgYXQgMTI6MjA6MDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC83LzE2IOS4i+WNiDEyOjEzLCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Pj4gT24g
Ny8xNi8yMDIwIDEyOjAyIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIDIwMjAvNy8xNiDk
uIrljYgxMTo1OSwgWmh1LCBMaW5nc2hhbiB3cm90ZToKPj4+Pj4gT24gNy8xNi8yMDIwIDEwOjU5
IEFNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4gT24gMjAyMC83LzE2IOS4iuWNiDk6MzksIFpo
dSwgTGluZ3NoYW4gd3JvdGU6Cj4+Pj4+Pj4gT24gNy8xNS8yMDIwIDk6NDMgUE0sIEphc29uIFdh
bmcgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDIwMjAvNy8xMiDkuIvljYgxMDo1MiwgWmh1IExpbmdzaGFu
IHdyb3RlOgo+Pj4+Pj4+Pj4gSGkgQWxsLAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoaXMgc2VyaWVz
IGludGVuZHMgdG8gaW1wbGVtZW50IElSUSBvZmZsb2FkaW5nIGZvcgo+Pj4+Pj4+Pj4gdmhvc3Rf
dmRwYS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBCeSB0aGUgZmVhdCBvZiBpcnEgZm9yd2FyZGluZyBm
YWNpbGl0aWVzIGxpa2UgcG9zdGVkCj4+Pj4+Pj4+PiBpbnRlcnJ1cHQgb24gWDg2LCBpcnEgYnlw
YXNzIGNhbsKgIGhlbHAgZGVsaXZlcgo+Pj4+Pj4+Pj4gaW50ZXJydXB0cyB0byB2Q1BVIGRpcmVj
dGx5Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IHZEUEEgZGV2aWNlcyBoYXZlIGRlZGljYXRlZCBoYXJk
d2FyZSBiYWNrZW5kcyBsaWtlIFZGSU8KPj4+Pj4+Pj4+IHBhc3MtdGhyb3VnaGVkIGRldmljZXMu
IFNvIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIHNldHVwCj4+Pj4+Pj4+PiBpcnEgb2ZmbG9hZGlu
ZyhpcnEgYnlwYXNzKSBmb3IgdkRQQSBkZXZpY2VzIGFuZCBnYWluCj4+Pj4+Pj4+PiBwZXJmb3Jt
YW5jZSBpbXByb3ZlbWVudHMuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSW4gbXkgdGVzdGluZywgd2l0
aCB0aGlzIGZlYXR1cmUsIHdlIGNhbiBzYXZlIDAuMW1zCj4+Pj4+Pj4+PiBpbiBhIHBpbmcgYmV0
d2VlbiB0d28gVkZzIG9uIGF2ZXJhZ2UuCj4+Pj4+Pj4+IEhpIExpbmdzaGFuOgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBEdXJpbmcgdGhlIHZpcnRpby1uZXR3b3JraW5nIG1lZXRpbmcsIE1pY2hhZWwgc3Bv
dHMKPj4+Pj4+Pj4gdHdvIHBvc3NpYmxlIGlzc3VlczoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gMSkgZG8g
d2UgbmVlZCBhbiBuZXcgdUFQSSB0byBzdG9wIHRoZSBpcnEgb2ZmbG9hZGluZz8KPj4+Pj4+Pj4g
MikgY2FuIGludGVycnVwdCBsb3N0IGR1cmluZyB0aGUgZXZlbnRmZCBjdHg/Cj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IEZvciAxKSBJIHRoaW5rIHdlIHByb2JhYmx5IG5vdCwgd2UgY2FuIGFsbG9jYXRlIGFu
Cj4+Pj4+Pj4+IGluZGVwZW5kZW50IGV2ZW50ZmQgd2hpY2ggZG9lcyBub3QgbWFwIHRvIE1TSVgu
IFNvCj4+Pj4+Pj4+IHRoZSBjb25zdW1lciBjYW4ndCBtYXRjaCB0aGUgcHJvZHVjZXIgYW5kIHdl
Cj4+Pj4+Pj4+IGZhbGxiYWNrIHRvIGV2ZW50ZmQgYmFzZWQgaXJxLgo+Pj4+Pj4+IEhpIEphc29u
LAo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB3b25kZXIgd2h5IHdlIG5lZWQgdG8gc3RvcCBpcnEgb2ZmbG9h
ZGluZywgYnV0IGlmIHdlCj4+Pj4+Pj4gbmVlZCB0byBkbyBzbywgbWF5YmUgYSBuZXcgdUFQSSB3
b3VsZCBiZSBtb3JlIGludHVpdGl2ZQo+Pj4+Pj4+IHRvIG1lLAo+Pj4+Pj4+IGJ1dCB3aHkgYW5k
IHdobyh1c2VyPyBxZW11Pykgc2hhbGwgaW5pdGlhbGl6ZSB0aGlzCj4+Pj4+Pj4gcHJvY2Vzcywg
YmFzZWQgb24gd2hhdCBraW5kYSBvZiBiYXNpcyB0byBtYWtlIHRoZQo+Pj4+Pj4+IGRlY2lzaW9u
Pwo+Pj4+Pj4gVGhlIHJlYXNvbiBpcyB3ZSBtYXkgd2FudCB0byBmYWxsYmFjayB0byBzb2Z0d2Fy
ZSBkYXRhcGF0aAo+Pj4+Pj4gZm9yIHNvbWUgcmVhc29uIChlLmcgc29mdHdhcmUgYXNzaXN0ZWQg
bGl2ZSBtaWdyYXRpb24pLiBJbgo+Pj4+Pj4gdGhpcyBjYXNlIHdlIG5lZWQgaW50ZXJjZXB0IGRl
dmljZSB3cml0ZSB0byB1c2VkIHJpbmcgc28gd2UKPj4+Pj4+IGNhbiBub3Qgb2ZmbG9hZGluZyB2
aXJ0cXVldWUgaW50ZXJydXB0IGluIHRoaXMgY2FzZS4KPj4+Pj4gc28gYWRkIGEgVkhPU1RfVkRQ
QV9TVE9QX0lSUV9PRkZMT0FESU5HPyBUaGVuIGRvIHdlIG5lZWQgYQo+Pj4+PiBWSE9TVF9WRFBB
X1NUQVJUX0lSUV9PRkZMT0FESU5HLCB0aGVuIGxldCB1c2Vyc3BhY2UgZnVsbHkKPj4+Pj4gY29u
dHJvbCB0aGlzPyBPciBhbnkgYmV0dGVyIGFwcHJvYWNoZXM/Cj4+Pj4gUHJvYmFibHkgbm90LCBp
dCdzIGFzIHNpbXBsZSBhcyBhbGxvY2F0aW5nIGFub3RoZXIgZXZlbnRmZCAoYnV0IG5vdAo+Pj4+
IGlycWZkKSwgYW5kIHBhc3MgaXQgdG8gdmhvc3QtdmRwYS4gVGhlbiB0aGUgb2ZmbG9hZGluZyBp
cyBkaXNhYmxlZAo+Pj4+IHNpbmNlIGl0IGRvZXNuJ3QgaGF2ZSBhIGNvbnN1bWVyLgo+Pj4gT0ss
IHNvdW5kcyBsaWtlIFFFTVUgd29yaywgbm8gbmVlZCB0byB0YWtlIGNhcmUgaW4gdGhpcyBzZXJp
ZXMsIHJpZ2h0Pwo+PiBUaGF0J3MgbXkgdW5kZXJzdGFuZGluZy4KPj4KPj4gVGhhbmtzCj4gTGV0
J3MgY29uZmlybSBhIHN3aXRjaCBoYXBwZW5zIGF0b21pY2FsbHkgc28gZWFjaCBpbnRlcnJ1cHQK
PiBpcyBzZW50IGVpdGhlciB0byBldmVudGZkIHRvIGd1ZXN0IGRpcmVjdGx5IHRob3VnaC4KCgpJ
IHRoaW5rIGl0J3Mgc2FmZSBzaW5jZToKCjEpIHdlIGRvbid0IGFsbG9jL2ZyZWUgaW50ZXJydXB0
IGR1cmluZyB0aGUgZXZlbnRmZCBjaGFuZ2UKMikgVGhlIGlydGUgaXMgbW9kaWZpZWQgYXV0b21h
dGljYWxseSB0aHJvdWdoIGNtcHhjaGdfZG91YmxlKCkgaW4gCm1vZGlmeV9pcnRlKCksIHNvIHRo
ZSBpbnRlcnJ1cHQgaXMgZWl0aGVyIHJlbWFwcGluZyB0byBldmVudGZkIG9yIHBpIApkZXNjcmlw
dG9yCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
