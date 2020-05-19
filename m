Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BF1D8F99
	for <lists.virtualization@lfdr.de>; Tue, 19 May 2020 07:53:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A23E787886;
	Tue, 19 May 2020 05:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAW9yeowjDKF; Tue, 19 May 2020 05:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E52B1877B4;
	Tue, 19 May 2020 05:52:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D32E5C07FF;
	Tue, 19 May 2020 05:52:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9E71C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 05:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0EB685EBE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 05:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhPxoS3gBNSE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 05:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6AF0E85EB8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 05:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589867573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8sf/V9iwhvJqIQR3nLkO+0EgUVeCfEhuWkJ9NRPG2w=;
 b=bwEorBm9EQw79eMp4qBihqEGeUvvnUi3QvH9qmcAs/TH/a+clVR0CzusFxs/EP93EHhd9M
 sn3AHkwVJ1lGKYRlZR9/i5p6oMge5iaHzmRvJmAhDz2w4I/wXu3CWmobEzS+9qSGD8xWsh
 hFAoAcsSZgcJP/h8A2k1iWJ3/2Ifylk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-nxLGNieMMVafcALNrIp15Q-1; Tue, 19 May 2020 01:52:51 -0400
X-MC-Unique: nxLGNieMMVafcALNrIp15Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 083CB1005510;
 Tue, 19 May 2020 05:52:45 +0000 (UTC)
Received: from [10.72.13.247] (ovpn-13-247.pek2.redhat.com [10.72.13.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 804DD2BFCC;
 Tue, 19 May 2020 05:52:39 +0000 (UTC)
Subject: Re: [PATCH V2] ifcvf: move IRQ request/free to status change handlers
To: Cindy Lu <lulu@redhat.com>
References: <1589270444-3669-1-git-send-email-lingshan.zhu@intel.com>
 <8aca85c3-3bf6-a1ec-7009-cd9a635647d7@redhat.com>
 <5bbe0c21-8638-45e4-04e8-02ad0df44b38@intel.com>
 <572ed6af-7a04-730e-c803-a41868091e88@redhat.com>
 <CACLfguXXPArd9UWX-HpfqNvgpWS=Nyt6SJ4kUkjjpVsVvVe9oA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c927fcff-de09-d623-e119-4611ab65ff04@redhat.com>
Date: Tue, 19 May 2020 13:52:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACLfguXXPArd9UWX-HpfqNvgpWS=Nyt6SJ4kUkjjpVsVvVe9oA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, Michael Tsirkin <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, "Zhu,
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

Ck9uIDIwMjAvNS8xOSDkuIrljYg5OjUxLCBDaW5keSBMdSB3cm90ZToKPiBIaSAsSmFzb24KPiBJ
dCB3b3JrcyBvayBpbiB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgcWVtdSB2ZHBhIGNvZGUgLCBTbyBJ
IHRoaW5rIHRoZQo+IHBhdGNoIGlzIG9rLgo+IFRoYW5rcwo+IENpbmR5CgoKVGhhbmtzIGZvciB0
aGUgdGVzdGluZywgKGJ0dywgd2UnZCBiZXR0ZXIgbm90IGRvIHRvcCBwb3N0aW5nIHdoZW4gCmRp
c2N1c3MgaW4gdGhlIGNvbW11bml0eSkuCgpTbywKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPgoKCgo+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDM6MTggUE0gSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjAvNS8xMyDk
uIvljYgxMjo0MiwgWmh1LCBMaW5nc2hhbiB3cm90ZToKPj4+Cj4+PiBPbiA1LzEzLzIwMjAgMTI6
MTIgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4gT24gMjAyMC81LzEyIOS4i+WNiDQ6MDAsIFpo
dSBMaW5nc2hhbiB3cm90ZToKPj4+Pj4gVGhpcyBjb21taXQgbW92ZSBJUlEgcmVxdWVzdCBhbmQg
ZnJlZSBvcGVyYXRpb25zIGZyb20gcHJvYmUoKQo+Pj4+PiB0byBWSVJUSU8gc3RhdHVzIGNoYW5n
ZSBoYW5kbGVyIHRvIGNvbXBseSB3aXRoIFZJUlRJTyBzcGVjLgo+Pj4+Pgo+Pj4+PiBWSVJUSU8g
c3BlYyAxLjEsIHNlY3Rpb24gMi4xLjIgRGV2aWNlIFJlcXVpcmVtZW50czogRGV2aWNlIFN0YXR1
cyBGaWVsZAo+Pj4+PiBUaGUgZGV2aWNlIE1VU1QgTk9UIGNvbnN1bWUgYnVmZmVycyBvciBzZW5k
IGFueSB1c2VkIGJ1ZmZlcgo+Pj4+PiBub3RpZmljYXRpb25zIHRvIHRoZSBkcml2ZXIgYmVmb3Jl
IERSSVZFUl9PSy4KPj4+Pgo+Pj4+IFRoaXMgY29tbWVudCBuZWVkcyB0byBiZSBjaGVja2VkIGFz
IEkgc2FpZCBwcmV2aW91c2x5LiBJdCdzIG9ubHkKPj4+PiBuZWVkZWQgaWYgd2UncmUgc3VyZSBp
ZmN2ZiBjYW4gZ2VuZXJhdGUgaW50ZXJydXB0IGJlZm9yZSBEUklWRVJfT0suCj4+Pj4KPj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+
Cj4+Pj4+IC0tLQo+Pj4+PiBjaGFuZ2VzIGZyb20gVjE6Cj4+Pj4+IHJlbW92ZSBpZmN2Zl9zdG9w
X2RhdGFwYXRoKCkgaW4gc3RhdHVzID09IDAgaGFuZGxlciwgd2UgZG9uJ3QgbmVlZAo+Pj4+PiB0
byBkbyB0aGlzCj4+Pj4+IHR3aWNlOyBoYW5kbGUgc3RhdHVzID09IDAgYWZ0ZXIgRFJJVkVSX09L
IC0+ICFEUklWRVJfT0sgaGFuZGxlcgo+Pj4+PiAoSmFzb24gV2FuZykKPj4+Pgo+Pj4+IFBhdGNo
IGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCB3aXRoIHRoaXMgcGF0Y2ggcGluZyBjYW5ub3Qgd29yayBv
biBteQo+Pj4+IG1hY2hpbmUuIChJdCB3b3JrcyB3aXRob3V0IHRoaXMgcGF0Y2gpLgo+Pj4+Cj4+
Pj4gVGhhbmtzCj4+PiBUaGlzIGlzIHN0cmFuZ2UsIGl0IHdvcmtzIG9uIG15IG1hY2hpbmVzLCBs
ZXQncyBoYXZlIGEgY2hlY2sgb2ZmbGluZS4KPj4+Cj4+PiBUaGFua3MsCj4+PiBCUgo+Pj4gWmh1
IExpbmdzaGFuCj4+Cj4+IEkgZ2l2ZSBpdCBhIHRyeSB3aXRoIHZpcml0by12cGRhIGFuZCBhIHRp
bnkgdXNlcnNwYWNlLiBFaXRoZXIgd29ya3MuCj4+Cj4+IFNvIGl0IGNvdWxkIGJlIGFuIGlzc3Vl
IG9mIHFlbXUgY29kZXMuCj4+Cj4+IExldCdzIHdhaXQgZm9yIENpbmR5IHRvIHRlc3QgaWYgaXQg
cmVhbGx5IHdvcmtzLgo+Pgo+PiBUaGFua3MKPj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
