Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155735EEA9
	for <lists.virtualization@lfdr.de>; Wed, 14 Apr 2021 09:50:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC5F845C1;
	Wed, 14 Apr 2021 07:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0J25EKdibJ0; Wed, 14 Apr 2021 07:50:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 519BF845C0;
	Wed, 14 Apr 2021 07:50:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D29A9C0012;
	Wed, 14 Apr 2021 07:50:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAF43C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91CA040EEF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiT34mC7EagM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:50:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D0D640EE7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618386605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1+hEzV1eb9qbk1su8ULoEmf0TKJMERUcSajKB2v3vU=;
 b=bCG34M27NrCrDCIcSo67JbafZUvAWL42xR1CLPeOYRtMXxNykValAhqrAj6XR2f5YwV5so
 2xj/2X54WAKMAJ1AYlyGNXRWR/UFPP3xJjzUziRN8zN+YbGqEKovbLgp9v9YcM8ZUsKKky
 TXM/3MTMdM5RmFwB1MHJTkVGsD9K8bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-TEu0HjeTNoetCTuJjv3a9Q-1; Wed, 14 Apr 2021 03:50:02 -0400
X-MC-Unique: TEu0HjeTNoetCTuJjv3a9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A25161009600;
 Wed, 14 Apr 2021 07:49:59 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-33.pek2.redhat.com
 [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 738E110074F1;
 Wed, 14 Apr 2021 07:49:46 +0000 (UTC)
Subject: Re: [PATCH v6 00/10] Introduce VDUSE - vDPA Device in Userspace
To: "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
References: <20210331080519.172-1-xieyongji@bytedance.com>
 <20210414032909-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a7126e76-05c6-533c-9c2b-e8e3041ec5f8@redhat.com>
Date: Wed, 14 Apr 2021 15:49:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414032909-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: axboe@kernel.dk, kvm@vger.kernel.org, corbet@lwn.net,
 netdev@vger.kernel.org, rdunlap@infradead.org, willy@infradead.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 christian.brauner@canonical.com, bcrl@kvack.org, viro@zeniv.linux.org.uk,
 stefanha@redhat.com, linux-fsdevel@vger.kernel.org, dan.carpenter@oracle.com,
 mika.penttila@nextfour.com
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC8xNCDPws7nMzozNCwgTWljaGFlbCBTLiBUc2lya2luINC0tcA6Cj4gT24gV2Vk
LCBNYXIgMzEsIDIwMjEgYXQgMDQ6MDU6MDlQTSArMDgwMCwgWGllIFlvbmdqaSB3cm90ZToKPj4g
VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhIGZyYW1ld29yaywgd2hpY2ggY2FuIGJlIHVzZWQgdG8g
aW1wbGVtZW50Cj4+IHZEUEEgRGV2aWNlcyBpbiBhIHVzZXJzcGFjZSBwcm9ncmFtLiBUaGUgd29y
ayBjb25zaXN0IG9mIHR3byBwYXJ0czoKPj4gY29udHJvbCBwYXRoIGZvcndhcmRpbmcgYW5kIGRh
dGEgcGF0aCBvZmZsb2FkaW5nLgo+Pgo+PiBJbiB0aGUgY29udHJvbCBwYXRoLCB0aGUgVkRVU0Ug
ZHJpdmVyIHdpbGwgbWFrZSB1c2Ugb2YgbWVzc2FnZQo+PiBtZWNobmlzbSB0byBmb3J3YXJkIHRo
ZSBjb25maWcgb3BlcmF0aW9uIGZyb20gdmRwYSBidXMgZHJpdmVyCj4+IHRvIHVzZXJzcGFjZS4g
VXNlcnNwYWNlIGNhbiB1c2UgcmVhZCgpL3dyaXRlKCkgdG8gcmVjZWl2ZS9yZXBseQo+PiB0aG9z
ZSBjb250cm9sIG1lc3NhZ2VzLgo+Pgo+PiBJbiB0aGUgZGF0YSBwYXRoLCB0aGUgY29yZSBpcyBt
YXBwaW5nIGRtYSBidWZmZXIgaW50byBWRFVTRQo+PiBkYWVtb24ncyBhZGRyZXNzIHNwYWNlLCB3
aGljaCBjYW4gYmUgaW1wbGVtZW50ZWQgaW4gZGlmZmVyZW50IHdheXMKPj4gZGVwZW5kaW5nIG9u
IHRoZSB2ZHBhIGJ1cyB0byB3aGljaCB0aGUgdkRQQSBkZXZpY2UgaXMgYXR0YWNoZWQuCj4+Cj4+
IEluIHZpcnRpby12ZHBhIGNhc2UsIHdlIGltcGxlbWVudHMgYSBNTVUtYmFzZWQgb24tY2hpcCBJ
T01NVSBkcml2ZXIgd2l0aAo+PiBib3VuY2UtYnVmZmVyaW5nIG1lY2hhbmlzbSB0byBhY2hpZXZl
IHRoYXQuIEFuZCBpbiB2aG9zdC12ZHBhIGNhc2UsIHRoZSBkbWEKPj4gYnVmZmVyIGlzIHJlc2lk
ZSBpbiBhIHVzZXJzcGFjZSBtZW1vcnkgcmVnaW9uIHdoaWNoIGNhbiBiZSBzaGFyZWQgdG8gdGhl
Cj4+IFZEVVNFIHVzZXJzcGFjZSBwcm9jZXNzcyB2aWEgdHJhbnNmZXJyaW5nIHRoZSBzaG1mZC4K
Pj4KPj4gVGhlIGRldGFpbHMgYW5kIG91ciB1c2VyIGNhc2UgaXMgc2hvd24gYmVsb3c6Cj4+Cj4+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiB8ICAgICAg
ICAgICAgQ29udGFpbmVyIHwgICAgfCAgICAgICAgICAgICAgUUVNVShWTSkgfCAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVkRVU0UgZGFlbW9uIHwKPj4gfCAgICAgICAtLS0tLS0t
LS0gICAgICB8ICAgIHwgIC0tLS0tLS0tLS0tLS0tLS0tLS0gIHwgICB8IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLSB8Cj4+IHwgICAgICAgfGRldi92ZHh8ICAgICAg
fCAgICB8ICB8L2Rldi92aG9zdC12ZHBhLXh8ICB8ICAgfCB8IHZEUEEgZGV2aWNlIGVtdWxhdGlv
biB8IHwgYmxvY2sgZHJpdmVyIHwgfAo+PiAtLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0gICAgIC0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLSAgIC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0KPj4gICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfAo+
PiAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICB8Cj4+IC0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLQo+PiB8ICAgIHwgYmxvY2sgZGV2aWNlIHwg
ICAgICAgICAgIHwgIHZob3N0IGRldmljZSB8ICAgICAgICAgICAgfCB2ZHVzZSBkcml2ZXIgfCAg
ICAgICAgICB8IFRDUC9JUCB8ICAgIHwKPj4gfCAgICAtLS0tLS0tKy0tLS0tLS0tICAgICAgICAg
ICAtLS0tLS0tLSstLS0tLS0tLSAgICAgICAgICAgIC0tLS0tLS0rLS0tLS0tLS0gICAgICAgICAg
LS0tLS0rLS0tLSAgICB8Cj4+IHwgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgfAo+PiB8IC0tLS0tLS0tLS0rLS0tLS0tLS0tLSAgICAgICAtLS0tLS0tLS0tKy0tLS0t
LS0tLS0tICAgICAgICAgLS0tLS0tLSstLS0tLS0tICAgICAgICAgICAgICAgIHwgICAgICAgIHwK
Pj4gfCB8IHZpcnRpby1ibGsgZHJpdmVyIHwgICAgICAgfCAgdmhvc3QtdmRwYSBkcml2ZXIgfCAg
ICAgICAgIHwgdmRwYSBkZXZpY2UgfCAgICAgICAgICAgICAgICB8ICAgICAgICB8Cj4+IHwgLS0t
LS0tLS0tLSstLS0tLS0tLS0tICAgICAgIC0tLS0tLS0tLS0rLS0tLS0tLS0tLS0gICAgICAgICAt
LS0tLS0tKy0tLS0tLS0gICAgICAgICAgICAgICAgfCAgICAgICAgfAo+PiB8ICAgICAgICAgICB8
ICAgICAgdmlydGlvIGJ1cyAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgIHwKPj4gfCAgIC0tLS0tLS0tKy0tLS0rLS0t
LS0tLS0tLS0gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgICB8Cj4+IHwgICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgfAo+PiB8ICAgICAgLS0tLS0tLS0tLSstLS0tLS0tLS0tICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgIHwKPj4gfCAgICAgIHwgdmlydGlvLWJsayBkZXZpY2UgfCAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICB8
Cj4+IHwgICAgICAtLS0tLS0tLS0tKy0tLS0tLS0tLS0gICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgfAo+PiB8ICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgIHwKPj4gfCAgICAgLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICB8Cj4+IHwgICAgIHwgIHZpcnRpby12ZHBh
IGRyaXZlciB8ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgfAo+PiB8ICAgICAtLS0tLS0tLS0tLSstLS0tLS0tLS0t
LSAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgIHwKPj4gfCAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIHZkcGEgYnVzICAgICAgICAgICB8
ICAgICAgICB8Cj4+IHwgICAgIC0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSAgICAgICAgICAgfCAgICAgICAg
fAo+PiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tLSstLS0gICAgIHwKPj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18IE5JQyB8LS0tLS0tCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tLSstLS0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0rLS0t
LS0tLS0tCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgUmVtb3RlIFN0b3JhZ2VzIHwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFRoaXMg
YWxsIGxvb2tzIHF1aXRlIHNpbWlsYXIgdG8gdmhvc3QtdXNlci1ibG9jayBleGNlcHQgdGhhdCBv
bmUKPiBkb2VzIG5vdCBuZWVkIGFueSBrZXJuZWwgc3VwcG9ydCBhdCBhbGwuCj4KPiBTbyBJIGFt
IHN0aWxsIHNjcmF0Y2hpbmcgbXkgaGVhZCBhYm91dCBpdHMgYWR2YW50YWdlcyBvdmVyCj4gdmhv
c3QtdXNlci1ibG9jay4KPgo+Cj4+IFdlIG1ha2UgdXNlIG9mIGl0IHRvIGltcGxlbWVudCBhIGJs
b2NrIGRldmljZSBjb25uZWN0aW5nIHRvCj4+IG91ciBkaXN0cmlidXRlZCBzdG9yYWdlLCB3aGlj
aCBjYW4gYmUgdXNlZCBib3RoIGluIGNvbnRhaW5lcnMgYW5kCj4+IFZNcy4gVGh1cywgd2UgY2Fu
IGhhdmUgYW4gdW5pZmllZCB0ZWNobm9sb2d5IHN0YWNrIGluIHRoaXMgdHdvIGNhc2VzLgo+IE1h
eWJlIHRoZSBjb250YWluZXIgcGFydCBpcyB0aGUgYW5zd2VyLiBIb3cgZG9lcyB0aGF0IHN0YWNr
IGxvb2s/CgoKWW9uZyBKaSBtYXkgYWRkIG1vcmUgYW5kIEkgdGhpbmsgdGhpcyBoYXMgYmVlbiBk
ZW1vbnN0cmF0ZWQgaW4gdGhlIGFib3ZlIApmaWd1cmU6IHRoZSB1c2Vyc3BhY2UgdkRQQSBkZXZp
Y2UgY2FuIHByb3ZpZGUgYSBrZW5yZWwgdmlyaXRvLWJsayBkZXZpY2UgCnZpYSB2aXJ0aW9fdmRw
YSBkcml2ZXIuCgpUaGFua3MKCgo+Cj4+IFRvIHRlc3QgaXQgd2l0aCBudWxsLWJsazoKPj4KPj4g
ICAgJCBxZW11LXN0b3JhZ2UtZGFlbW9uIFwKPj4gICAgICAgIC0tY2hhcmRldiBzb2NrZXQsaWQ9
Y2hhcm1vbml0b3IscGF0aD0vdG1wL3FtcC5zb2NrLHNlcnZlcixub3dhaXQgXAo+PiAgICAgICAg
LS1tb25pdG9yIGNoYXJkZXY9Y2hhcm1vbml0b3IgXAo+PiAgICAgICAgLS1ibG9ja2RldiBkcml2
ZXI9aG9zdF9kZXZpY2UsY2FjaGUuZGlyZWN0PW9uLGFpbz1uYXRpdmUsZmlsZW5hbWU9L2Rldi9u
dWxsYjAsbm9kZS1uYW1lPWRpc2swIFwKPj4gICAgICAgIC0tZXhwb3J0IHR5cGU9dmR1c2UtYmxr
LGlkPXRlc3Qsbm9kZS1uYW1lPWRpc2swLHdyaXRhYmxlPW9uLG5hbWU9dmR1c2UtbnVsbCxudW0t
cXVldWVzPTE2LHF1ZXVlLXNpemU9MTI4Cj4+Cj4+IFRoZSBxZW11LXN0b3JhZ2UtZGFlbW9uIGNh
biBiZSBmb3VuZCBhdCBodHRwczovL2dpdGh1Yi5jb20vYnl0ZWRhbmNlL3FlbXUvdHJlZS92ZHVz
ZQo+Pgo+PiBGdXR1cmUgd29yazoKPj4gICAgLSBJbXByb3ZlIHBlcmZvcm1hbmNlCj4+ICAgIC0g
VXNlcnNwYWNlIGxpYnJhcnkgKGZpbmQgYSB3YXkgdG8gcmV1c2UgZGV2aWNlIGVtdWxhdGlvbiBj
b2RlIGluIHFlbXUvcnVzdC12bW0pCj4+Cj4+IFY1IHRvIFY2Ogo+PiAtIEV4cG9ydCByZWNlaXZl
X2ZkKCkgaW5zdGVhZCBvZiBfX3JlY2VpdmVfZmQoKQo+PiAtIEZhY3RvciBvdXQgdGhlIHVubWFw
cGluZyBsb2dpYyBvZiBwYSBhbmQgdmEgc2VwYXJhdGVkbHkKPj4gLSBSZW1vdmUgdGhlIGxvZ2lj
IG9mIGJvdW5jZSBwYWdlIGFsbG9jYXRpb24gaW4gcGFnZSBmYXVsdCBoYW5kbGVyCj4+IC0gVXNl
IFBBR0VfU0laRSBhcyBJT1ZBIGFsbG9jYXRpb24gZ3JhbnVsZQo+PiAtIEFkZCBFUE9MTE9VVCBz
dXBwb3J0Cj4+IC0gRW5hYmxlIHNldHRpbmcgQVBJIHZlcnNpb24gaW4gdXNlcnNwYWNlCj4+IC0g
Rml4IHNvbWUgYnVncwo+Pgo+PiBWNCB0byBWNToKPj4gLSBSZW1vdmUgdGhlIHBhdGNoIGZvciBp
cnEgYmluZGluZwo+PiAtIFVzZSBhIHNpbmdsZSBJT1RMQiBmb3IgYWxsIHR5cGVzIG9mIG1hcHBp
bmcKPj4gLSBGYWN0b3Igb3V0IHZob3N0X3ZkcGFfcGFfbWFwKCkKPj4gLSBBZGQgc29tZSBzYW1w
bGUgY29kZXMgaW4gZG9jdW1lbnQKPj4gLSBVc2UgcmVjZWljZV9mZF91c2VyKCkgdG8gcGFzcyBm
aWxlIGRlc2NyaXB0b3IKPj4gLSBGaXggc29tZSBidWdzCj4+Cj4+IFYzIHRvIFY0Ogo+PiAtIFJl
YmFzZSB0byB2aG9zdC5naXQKPj4gLSBTcGxpdCBzb21lIHBhdGNoZXMKPj4gLSBBZGQgc29tZSBk
b2N1bWVudHMKPj4gLSBVc2UgaW9jdGwgdG8gaW5qZWN0IGludGVycnVwdCByYXRoZXIgdGhhbiBl
dmVudGZkCj4+IC0gRW5hYmxlIGNvbmZpZyBpbnRlcnJ1cHQgc3VwcG9ydAo+PiAtIFN1cHBvcnQg
YmluZGluZyBpcnEgdG8gdGhlIHNwZWNpZmllZCBjcHUKPj4gLSBBZGQgdHdvIG1vZHVsZSBwYXJh
bWV0ZXIgdG8gbGltaXQgYm91bmNlL2lvdmEgc2l6ZQo+PiAtIENyZWF0ZSBjaGFyIGRldmljZSBy
YXRoZXIgdGhhbiBhbm9uIGlub2RlIHBlciB2ZHVzZQo+PiAtIFJldXNlIHZob3N0IElPVExCIGZv
ciBpb3ZhIGRvbWFpbgo+PiAtIFJld29yayB0aGUgbWVzc2FnZSBtZWNobmlzbSBpbiBjb250cm9s
IHBhdGgKPj4KPj4gVjIgdG8gVjM6Cj4+IC0gUmV3b3JrIHRoZSBNTVUtYmFzZWQgSU9NTVUgZHJp
dmVyCj4+IC0gVXNlIHRoZSBpb3ZhIGRvbWFpbiBhcyBpb3ZhIGFsbG9jYXRvciBpbnN0ZWFkIG9m
IGdlbnBvb2wKPj4gLSBTdXBwb3J0IHRyYW5zZmVycmluZyB2bWEtPnZtX2ZpbGUgaW4gdmhvc3Qt
dmRwYQo+PiAtIEFkZCBTVkEgc3VwcG9ydCBpbiB2aG9zdC12ZHBhCj4+IC0gUmVtb3ZlIHRoZSBw
YXRjaGVzIG9uIGJvdW5jZSBwYWdlcyByZWNsYWltCj4+Cj4+IFYxIHRvIFYyOgo+PiAtIEFkZCB2
aG9zdC12ZHBhIHN1cHBvcnQKPj4gLSBBZGQgc29tZSBkb2N1bWVudHMKPj4gLSBCYXNlZCBvbiB0
aGUgdmRwYSBtYW5hZ2VtZW50IHRvb2wKPj4gLSBJbnRyb2R1Y2UgYSB3b3JrcXVldWUgZm9yIGly
cSBpbmplY3Rpb24KPj4gLSBSZXBsYWNlIGludGVydmFsIHRyZWUgd2l0aCBhcnJheSBtYXAgdG8g
c3RvcmUgdGhlIGlvdmFfbWFwCj4+Cj4+IFhpZSBZb25namkgKDEwKToKPj4gICAgZmlsZTogRXhw
b3J0IHJlY2VpdmVfZmQoKSB0byBtb2R1bGVzCj4+ICAgIGV2ZW50ZmQ6IEluY3JlYXNlIHRoZSBy
ZWN1cnNpb24gZGVwdGggb2YgZXZlbnRmZF9zaWduYWwoKQo+PiAgICB2aG9zdC12ZHBhOiBwcm90
ZWN0IGNvbmN1cnJlbnQgYWNjZXNzIHRvIHZob3N0IGRldmljZSBpb3RsYgo+PiAgICB2aG9zdC1p
b3RsYjogQWRkIGFuIG9wYXF1ZSBwb2ludGVyIGZvciB2aG9zdCBJT1RMQgo+PiAgICB2ZHBhOiBB
ZGQgYW4gb3BhcXVlIHBvaW50ZXIgZm9yIHZkcGFfY29uZmlnX29wcy5kbWFfbWFwKCkKPj4gICAg
dmRwYTogZmFjdG9yIG91dCB2aG9zdF92ZHBhX3BhX21hcCgpIGFuZCB2aG9zdF92ZHBhX3BhX3Vu
bWFwKCkKPj4gICAgdmRwYTogU3VwcG9ydCB0cmFuc2ZlcnJpbmcgdmlydHVhbCBhZGRyZXNzaW5n
IGR1cmluZyBETUEgbWFwcGluZwo+PiAgICB2ZHVzZTogSW1wbGVtZW50IGFuIE1NVS1iYXNlZCBJ
T01NVSBkcml2ZXIKPj4gICAgdmR1c2U6IEludHJvZHVjZSBWRFVTRSAtIHZEUEEgRGV2aWNlIGlu
IFVzZXJzcGFjZQo+PiAgICBEb2N1bWVudGF0aW9uOiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgVkRV
U0UKPj4KPj4gICBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW5kZXgucnN0ICAgICAgICAg
ICAgICB8ICAgIDEgKwo+PiAgIERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pb2N0bC9pb2N0
bC1udW1iZXIucnN0IHwgICAgMSArCj4+ICAgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL3Zk
dXNlLnJzdCAgICAgICAgICAgICAgfCAgMjEyICsrKwo+PiAgIGRyaXZlcnMvdmRwYS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMCArCj4+ICAgZHJpdmVycy92ZHBh
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4gICBkcml2
ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0K
Pj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMgICAgICAgICAgICAgICAgICB8
ICAgIDIgKy0KPj4gICBkcml2ZXJzL3ZkcGEvdmRwYS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDkgKy0KPj4gICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyAg
ICAgICAgICAgICAgICAgICB8ICAgIDggKy0KPj4gICBkcml2ZXJzL3ZkcGEvdmRwYV91c2VyL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDUgKwo+PiAgIGRyaXZlcnMvdmRwYS92ZHBh
X3VzZXIvaW92YV9kb21haW4uYyAgICAgICAgICAgICAgIHwgIDUyMSArKysrKysrKwo+PiAgIGRy
aXZlcnMvdmRwYS92ZHBhX3VzZXIvaW92YV9kb21haW4uaCAgICAgICAgICAgICAgIHwgICA3MCAr
Cj4+ICAgZHJpdmVycy92ZHBhL3ZkcGFfdXNlci92ZHVzZV9kZXYuYyAgICAgICAgICAgICAgICAg
fCAxMzYyICsrKysrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy92ZHBhL3ZpcnRpb19wY2kv
dnBfdmRwYS5jICAgICAgICAgICAgICAgICAgfCAgICAyICstCj4+ICAgZHJpdmVycy92aG9zdC9p
b3RsYi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIwICstCj4+ICAgZHJpdmVy
cy92aG9zdC92ZHBhLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTU0ICsrLQo+
PiAgIGZzL2V2ZW50ZmQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgMiArLQo+PiAgIGZzL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgNiArCj4+ICAgaW5jbHVkZS9saW51eC9ldmVudGZkLmggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICA1ICstCj4+ICAgaW5jbHVkZS9saW51eC9maWxlLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICstCj4+ICAgaW5jbHVkZS9saW51eC92ZHBh
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIxICstCj4+ICAgaW5jbHVkZS9s
aW51eC92aG9zdF9pb3RsYi5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzICsKPj4gICBp
bmNsdWRlL3VhcGkvbGludXgvdmR1c2UuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNzUg
KysrCj4+ICAgMjMgZmlsZXMgY2hhbmdlZCwgMjU0OCBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlv
bnMoLSkKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBp
L3ZkdXNlLnJzdAo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvdmRwYV91c2Vy
L01ha2VmaWxlCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS92ZHBhX3VzZXIv
aW92YV9kb21haW4uYwo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvdmRwYV91
c2VyL2lvdmFfZG9tYWluLmgKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZHBhL3Zk
cGFfdXNlci92ZHVzZV9kZXYuYwo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkv
bGludXgvdmR1c2UuaAo+Pgo+PiAtLSAKPj4gMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
