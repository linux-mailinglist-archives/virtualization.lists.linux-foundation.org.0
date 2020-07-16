Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A922220D8
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 12:45:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 21CBD888A6;
	Thu, 16 Jul 2020 10:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0k0Kj1JXf8X; Thu, 16 Jul 2020 10:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6CE448AE27;
	Thu, 16 Jul 2020 10:45:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EA20C0733;
	Thu, 16 Jul 2020 10:45:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9B66C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA7D2876D5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 10:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiGut5_ltpji
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 10:45:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3362876B0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594896313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxYWZgwLWn7Rnmoh675ZCFOcGubhbtM3QKjvJxepby8=;
 b=KFvkNB2WJZbdNta+mw8bkTZXN2FtpgYippr79V8H2AbtJR/2jDiheGzVIpFyXJ+dsU5J04
 6HrUJYBcXUwWTSZLSjNfdWh64R2hlD/eWJ6lH0/e8po2HOhNlnXnAmXHngq2KqC82HKqQl
 QiPYpU0yXcx5lKL2kPPu1eGs4GHJQp4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-EW_yfC33Nwe9wZqiFSRBtg-1; Thu, 16 Jul 2020 06:45:07 -0400
X-MC-Unique: EW_yfC33Nwe9wZqiFSRBtg-1
Received: by mail-wr1-f69.google.com with SMTP id b8so5379822wro.19
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 03:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OxYWZgwLWn7Rnmoh675ZCFOcGubhbtM3QKjvJxepby8=;
 b=UzVIqldOZcVf9gfiAnrz2SOqxHQ5HdKna4gW227hfQowS4dPLrAJExdraw7+zcduUW
 5sE70B8XldLYy/Jvm8hpXcIZ6q/M7X6yr6AH3jumNnjEwQS1NaBGQHhBsPUQGrsse1ET
 7VVCK9UHLy4VqjLhe8GAGNMn/JAFGct8qZl7XGRU3Zvdfstzd5/NPnYJNX/phsbWE8IE
 +4IO1s7YaXDOLRGKLYJnq+j87pcJKW6qEMrzl/HVytHqO5hMjVRX8mJ46+Y12Oz3rsuI
 8NdPgpQZ12d4K7vKXw/g/cY6yGZpawyW+k12YceuN3f6VPmwDjU0L7zpi/8nClcAzS50
 T48w==
X-Gm-Message-State: AOAM5331qBEeSIEALNubKo4+Re2i8OhxAJnWL0esXd9UxM2Jd6I9GbnP
 fNSUBr1JIzbM1GOMUq7qBrIYM6wuS0uIgMuqIIz36o3diOP8EwN+FRWDGCmqtBgjuP4VXIvaXbS
 4u+y/1LCC4yKYMYFXtORbAIaG4AXrux6MA8lWQLu6YQ==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr4277122wrw.28.1594896306113; 
 Thu, 16 Jul 2020 03:45:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYbnuKjraPbNIkft/3GTUfSsNTNTx6l/aUgESxOucWFlYdAHLRLOjvsyeHY5kY8Vrt3fD+lA==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr4277090wrw.28.1594896305809; 
 Thu, 16 Jul 2020 03:45:05 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 w128sm8996937wmb.19.2020.07.16.03.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 03:45:04 -0700 (PDT)
Date: Thu, 16 Jul 2020 06:45:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: teawater <teawaterz@linux.alibaba.com>
Subject: Re: [virtio-dev] [RFC for Linux v4 0/2] virtio_balloon: Add
 VIRTIO_BALLOON_F_CONT_PAGES to report continuous pages
Message-ID: <20200716064340-mutt-send-email-mst@kernel.org>
References: <1594867315-8626-1-git-send-email-teawater@gmail.com>
 <20200716021929-mutt-send-email-mst@kernel.org>
 <744230FA-78D8-4568-8188-683087065E84@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <744230FA-78D8-4568-8188-683087065E84@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrea Arcangeli <aarcange@redhat.com>, virtio-dev@lists.oasis-open.org,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, Hui Zhu <teawater@gmail.com>
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

T24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMDM6MDE6MThQTSArMDgwMCwgdGVhd2F0ZXIgd3JvdGU6
Cj4gCj4gCj4gPiAyMDIw5bm0N+aciDE25pelIDE0OjM477yMTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT4g5YaZ6YGT77yaCj4gPiAKPiA+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0
IDEwOjQxOjUwQU0gKzA4MDAsIEh1aSBaaHUgd3JvdGU6Cj4gPj4gVGhlIGZpcnN0LCBzZWNvbmQg
YW5kIHRoaXJkIHZlcnNpb24gYXJlIGluIFsxXSwgWzJdIGFuZCBbM10uCj4gPj4gQ29kZSBvZiBj
dXJyZW50IHZlcnNpb24gZm9yIExpbnV4IGFuZCBxZW11IGlzIGF2YWlsYWJsZSBpbiBbNF0gYW5k
IFs1XS4KPiA+PiBVcGRhdGUgb2YgdGhpcyB2ZXJzaW9uOgo+ID4+IDEuIFJlcG9ydCBjb250aW51
b3VzIHBhZ2VzIHdpbGwgaW5jcmVhc2UgdGhlIHNwZWVkLiAgU28gYWRkZWQgZGVmbGF0ZQo+ID4+
ICAgY29udGludW91cyBwYWdlcy4KPiA+PiAyLiBBY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnRzIGZy
b20gRGF2aWQgaW4gWzZdLCBhZGRlZCAyIG5ldyB2cXMgaW5mbGF0ZV9jb250X3ZxCj4gPj4gICBh
bmQgZGVmbGF0ZV9jb250X3ZxIHRvIHJlcG9ydCBjb250aW51b3VzIHBhZ2VzIHdpdGggZm9ybWF0
IDMyIGJpdHMgcGZuIGFuZCAzMgo+ID4+ICAgYml0cyBzaXplLgo+ID4+IEZvbGxvd2luZyBpcyB0
aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBmdW5jdGlvbi4KPiA+PiBUaGVzZSBwYXRjaGVzIGFkZCBW
SVJUSU9fQkFMTE9PTl9GX0NPTlRfUEFHRVMgdG8gdmlydGlvX2JhbGxvb24uIFdpdGggdGhpcwo+
ID4+IGZsYWcsIGJhbGxvb24gdHJpZXMgdG8gdXNlIGNvbnRpbnVvdXMgcGFnZXMgdG8gaW5mbGF0
ZSBhbmQgZGVmbGF0ZS4KPiA+PiBPcGVuaW5nIHRoaXMgZmxhZyBjYW4gYnJpbmcgdHdvIGJlbmVm
aXRzOgo+ID4+IDEuIFJlcG9ydCBjb250aW51b3VzIHBhZ2VzIHdpbGwgaW5jcmVhc2UgbWVtb3J5
IHJlcG9ydCBzaXplIG9mIGVhY2ggdGltZQo+ID4+ICAgY2FsbCB0ZWxsX2hvc3QuICBUaGVuIGl0
IHdpbGwgaW5jcmVhc2UgdGhlIHNwZWVkIG9mIGJhbGxvb24gaW5mbGF0ZSBhbmQKPiA+PiAgIGRl
ZmxhdGUuCj4gPj4gMi4gSG9zdCBUSFBzIHdpbGwgYmUgc3BsaXR0ZWQgd2hlbiBxZW11IHJlbGVh
c2UgdGhlIHBhZ2Ugb2YgYmFsbG9vbiBpbmZsYXRlLgo+ID4+ICAgSW5mbGF0ZSBiYWxsb29uIHdp
dGggY29udGludW91cyBwYWdlcyB3aWxsIGxldCBRRU1VIHJlbGVhc2UgdGhlIHBhZ2VzCj4gPj4g
ICBvZiBzYW1lIFRIUHMuICBUaGF0IHdpbGwgaGVscCBkZWNyZWFzZSB0aGUgc3BsaXR0ZWQgVEhQ
cyBudW1iZXIgaW4KPiA+PiAgIHRoZSBob3N0Lgo+ID4+ICAgRm9sbG93aW5nIGlzIGFuIGV4YW1w
bGUgaW4gYSBWTSB3aXRoIDFHIG1lbW9yeSAxQ1BVLiAgVGhpcyB0ZXN0IHNldHVwcyBhbgo+ID4+
ICAgZW52aXJvbm1lbnQgdGhhdCBoYXMgYSBsb3Qgb2YgZnJhZ21lbnRhdGlvbiBwYWdlcy4gIFRo
ZW4gaW5mbGF0ZSBiYWxsb29uIHdpbGwKPiA+PiAgIHNwbGl0IHRoZSBUSFBzLgo+IAo+IAo+ID4+
IC8vIFRoaXMgaXMgdGhlIFRIUCBudW1iZXIgYmVmb3JlIFZNIGV4ZWN1dGlvbiBpbiB0aGUgaG9z
dC4KPiA+PiAvLyBOb25lIHVzZSBUSFAuCj4gPj4gY2F0IC9wcm9jL21lbWluZm8gfCBncmVwIEFu
b25IdWdlUGFnZXM6Cj4gPj4gQW5vbkh1Z2VQYWdlczogICAgICAgICAwIGtCCj4gVGhlc2UgbGlu
ZXMgYXJlIGZyb20gaG9zdC4KPiAKPiA+PiAvLyBBZnRlciBWTSBzdGFydCwgdXNlIHVzZW1lbQo+
ID4+IC8vIChodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC93
Zmcvdm0tc2NhbGFiaWxpdHkuZ2l0KQo+ID4+IC8vIHB1bmNoLWhvbGVzIGZ1bmN0aW9uIGdlbmVy
YXRlcyA0MDBtIGZyYWdtZW50YXRpb24gcGFnZXMgaW4gdGhlIGd1ZXN0Cj4gPj4gLy8ga2VybmVs
Lgo+ID4+IHVzZW1lbSAtLXB1bmNoLWhvbGVzIC1zIC0xIDgwMG0gJgo+IFRoZXNlIGxpbmVzIGFy
ZSBmcm9tIGd1ZXN0LiAgVGhleSBzZXR1cHMgdGhlIGVudmlyb25tZW50IHRoYXQgaGFzIGEgbG90
IG9mIGZyYWdtZW50YXRpb24gcGFnZXMuCj4gCj4gPj4gLy8gVGhpcyBpcyB0aGUgVEhQIG51bWJl
ciBhZnRlciB0aGlzIGNvbW1hbmQgaW4gdGhlIGhvc3QuCj4gPj4gLy8gU29tZSBUSFAgaXMgdXNl
ZCBieSBWTSBiZWNhdXNlIHVzZW1lbSB3aWxsIGFjY2VzcyA4MDBNIG1lbW9yeQo+ID4+IC8vIGlu
IHRoZSBndWVzdC4KPiA+PiBjYXQgL3Byb2MvbWVtaW5mbyB8IGdyZXAgQW5vbkh1Z2VQYWdlczoK
PiA+PiBBbm9uSHVnZVBhZ2VzOiAgICA5MTEzNjAga0IKPiBUaGVzZSBsaW5lcyBhcmUgZnJvbSBo
b3N0Lgo+IAo+ID4+IC8vIENvbm5lY3QgdG8gdGhlIFFFTVUgbW9uaXRvciwgc2V0dXAgYmFsbG9v
biwgYW5kIHNldCBpdCBzaXplIHRvIDYwME0uCj4gPj4gKHFlbXUpIGRldmljZV9hZGQgdmlydGlv
LWJhbGxvb24tcGNpLGlkPWJhbGxvb24xCj4gPj4gKHFlbXUpIGluZm8gYmFsbG9vbgo+ID4+IGJh
bGxvb246IGFjdHVhbD0xMDI0Cj4gPj4gKHFlbXUpIGJhbGxvb24gNjAwCj4gPj4gKHFlbXUpIGlu
Zm8gYmFsbG9vbgo+ID4+IGJhbGxvb246IGFjdHVhbD02MDAKPiBUaGVzZSBsaW5lcyBhcmUgZnJv
bSBob3N0Lgo+IAo+ID4+IC8vIFRoaXMgaXMgdGhlIFRIUCBudW1iZXIgYWZ0ZXIgaW5mbGF0ZSB0
aGUgYmFsbG9vbiBpbiB0aGUgaG9zdC4KPiA+PiBjYXQgL3Byb2MvbWVtaW5mbyB8IGdyZXAgQW5v
bkh1Z2VQYWdlczoKPiA+PiBBbm9uSHVnZVBhZ2VzOiAgICAgODgwNjQga0IKPiBUaGVzZSBsaW5l
cyBhcmUgZnJvbSBob3N0Lgo+IAo+ID4+IC8vIFNldCB0aGUgc2l6ZSBiYWNrIHRvIDEwMjRNIGlu
IHRoZSBRRU1VIG1vbml0b3IuCj4gPj4gKHFlbXUpIGJhbGxvb24gMTAyNAo+ID4+IChxZW11KSBp
bmZvIGJhbGxvb24KPiA+PiBiYWxsb29uOiBhY3R1YWw9MTAyNAo+IFRoZXNlIGxpbmVzIGFyZSBm
cm9tIGhvc3QuCj4gCj4gPj4gLy8gVXNlIHVzZW1lbSB0byBpbmNyZWFzZSB0aGUgbWVtb3J5IHVz
YWdlIG9mIFFFTVUuCj4gPj4ga2lsbGFsbCB1c2VtZW0KPiA+PiB1c2VtZW0gODAwbQo+IFRoZXNl
IGxpbmVzIGFyZSBmcm9tIGd1ZXN0Lgo+IAo+ID4+IC8vIFRoaXMgaXMgdGhlIFRIUCBudW1iZXIg
YWZ0ZXIgdGhpcyBvcGVyYXRpb24uCj4gPj4gY2F0IC9wcm9jL21lbWluZm8gfCBncmVwIEFub25I
dWdlUGFnZXM6Cj4gPj4gQW5vbkh1Z2VQYWdlczogICAgIDY1NTM2IGtCCj4gVGhlc2UgbGluZXMg
YXJlIGZyb20gaG9zdC4KPiAKPiAKPiAKPiA+PiAKPiA+PiBGb2xsb3dpbmcgZXhhbXBsZSBjaGFu
Z2UgdG8gdXNlIGNvbnRpbnVvdXMgcGFnZXMgYmFsbG9vbi4gIFRoZSBudW1iZXIgb2YKPiA+PiBz
cGxpdHRlZCBUSFBzIGlzIGRlY3JlYXNlZC4KPiA+PiAvLyBUaGlzIGlzIHRoZSBUSFAgbnVtYmVy
IGJlZm9yZSBWTSBleGVjdXRpb24gaW4gdGhlIGhvc3QuCj4gPj4gLy8gTm9uZSB1c2UgVEhQLgo+
ID4+IGNhdCAvcHJvYy9tZW1pbmZvIHwgZ3JlcCBBbm9uSHVnZVBhZ2VzOgo+ID4+IEFub25IdWdl
UGFnZXM6ICAgICAgICAgMCBrQgo+IFRoZXNlIGxpbmVzIGFyZSBmcm9tIGhvc3QuCj4gCj4gPj4g
Ly8gQWZ0ZXIgVk0gc3RhcnQsIHVzZSB1c2VtZW0gcHVuY2gtaG9sZXMgZnVuY3Rpb24gZ2VuZXJh
dGVzIDQwME0KPiA+PiAvLyBmcmFnbWVudGF0aW9uIHBhZ2VzIGluIHRoZSBndWVzdCBrZXJuZWwu
Cj4gPj4gdXNlbWVtIC0tcHVuY2gtaG9sZXMgLXMgLTEgODAwbSAmCj4gVGhlc2UgbGluZXMgYXJl
IGZyb20gZ3Vlc3QuICBUaGV5IHNldHVwcyB0aGUgZW52aXJvbm1lbnQgdGhhdCBoYXMgYSBsb3Qg
b2YgZnJhZ21lbnRhdGlvbiBwYWdlcy4KPiAKPiA+PiAvLyBUaGlzIGlzIHRoZSBUSFAgbnVtYmVy
IGFmdGVyIHRoaXMgY29tbWFuZCBpbiB0aGUgaG9zdC4KPiA+PiAvLyBTb21lIFRIUCBpcyB1c2Vk
IGJ5IFZNIGJlY2F1c2UgdXNlbWVtIHdpbGwgYWNjZXNzIDgwME0gbWVtb3J5Cj4gPj4gLy8gaW4g
dGhlIGd1ZXN0Lgo+ID4+IGNhdCAvcHJvYy9tZW1pbmZvIHwgZ3JlcCBBbm9uSHVnZVBhZ2VzOgo+
ID4+IEFub25IdWdlUGFnZXM6ICAgIDkxMTM2MCBrQgo+IFRoZXNlIGxpbmVzIGFyZSBmcm9tIGhv
c3QuCj4gCj4gPj4gLy8gQ29ubmVjdCB0byB0aGUgUUVNVSBtb25pdG9yLCBzZXR1cCBiYWxsb29u
LCBhbmQgc2V0IGl0IHNpemUgdG8gNjAwTS4KPiA+PiAocWVtdSkgZGV2aWNlX2FkZCB2aXJ0aW8t
YmFsbG9vbi1wY2ksaWQ9YmFsbG9vbjEsY29udC1wYWdlcz1vbgo+ID4+IChxZW11KSBpbmZvIGJh
bGxvb24KPiA+PiBiYWxsb29uOiBhY3R1YWw9MTAyNAo+ID4+IChxZW11KSBiYWxsb29uIDYwMAo+
ID4+IChxZW11KSBpbmZvIGJhbGxvb24KPiA+PiBiYWxsb29uOiBhY3R1YWw9NjAwCj4gVGhlc2Ug
bGluZXMgYXJlIGZyb20gaG9zdC4KPiAKPiA+PiAvLyBUaGlzIGlzIHRoZSBUSFAgbnVtYmVyIGFm
dGVyIGluZmxhdGUgdGhlIGJhbGxvb24gaW4gdGhlIGhvc3QuCj4gPj4gY2F0IC9wcm9jL21lbWlu
Zm8gfCBncmVwIEFub25IdWdlUGFnZXM6Cj4gPj4gQW5vbkh1Z2VQYWdlczogICAgNjE2NDQ4IGtC
Cj4gPj4gLy8gU2V0IHRoZSBzaXplIGJhY2sgdG8gMTAyNE0gaW4gdGhlIFFFTVUgbW9uaXRvci4K
PiA+PiAocWVtdSkgYmFsbG9vbiAxMDI0Cj4gPj4gKHFlbXUpIGluZm8gYmFsbG9vbgo+ID4+IGJh
bGxvb246IGFjdHVhbD0xMDI0Cj4gVGhlc2UgbGluZXMgYXJlIGZyb20gaG9zdC4KPiAKPiA+PiAv
LyBVc2UgdXNlbWVtIHRvIGluY3JlYXNlIHRoZSBtZW1vcnkgdXNhZ2Ugb2YgUUVNVS4KPiA+PiBr
aWxsYWxsIHVzZW1lbQo+ID4+IHVzZW1lbSA4MDBtCj4gVGhlc2UgbGluZXMgYXJlIGZyb20gZ3Vl
c3QuCj4gCj4gPj4gLy8gVGhpcyBpcyB0aGUgVEhQIG51bWJlciBhZnRlciB0aGlzIG9wZXJhdGlv
bi4KPiA+PiBjYXQgL3Byb2MvbWVtaW5mbyB8IGdyZXAgQW5vbkh1Z2VQYWdlczoKPiA+PiBBbm9u
SHVnZVBhZ2VzOiAgICA5MDcyNjQga0IKPiBUaGVzZSBsaW5lcyBhcmUgZnJvbSBob3N0Lgo+IAo+
ID4gCj4gPiBJJ20gYSBiaXQgY29uZnVzZWQgYWJvdXQgd2hpY2ggb2YgdGhlIGFib3ZlIHJ1biB3
aXRoaW4gZ3Vlc3QsCj4gPiBhbmQgd2hpY2ggcnVuIHdpdGhpbiBob3N0LiBDb3VsZCB5b3UgZXhw
bGFpbiBwbHM/Cj4gPiAKPiA+IAo+IAo+IEkgYWRkZWQgc29tZSBpbnRyb2R1Y3Rpb24gdG8gc2hv
dyB3aGVyZSB0aGVzZSBsaW5lcyBpcyBnZXQgZnJvbS4KPiAKPiBCZXN0LAo+IEh1aQoKCk9LIHNv
IHdlIHNlZSBob3N0IGhhcyBtb3JlIGZyZWUgVEhQcy4gQnV0IGd1ZXN0IGhhcyBwcmVzdW1hYmx5
IGxlc3Mgbm93IC0gc28KdGhlIHRvdGFsIHBhZ2UgdGFibGUgZGVwdGggaXMgdGhlIHNhbWUuIERp
ZCB3ZSBnYWluIGFueXRoaW5nPwoKPiAKPiA+IAo+ID4+IFsxXSBodHRwczovL2xrbWwub3JnL2xr
bWwvMjAyMC8zLzEyLzE0NAo+ID4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
bS8xNTg0ODkzMDk3LTEyMzE3LTEtZ2l0LXNlbmQtZW1haWwtdGVhd2F0ZXJAZ21haWwuY29tLwo+
ID4+IFszXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC81LzEyLzMyNAo+ID4+IFs0XSBodHRw
czovL2dpdGh1Yi5jb20vdGVhd2F0ZXIvbGludXgvdHJlZS9iYWxsb29uX2NvbnRzCj4gPj4gWzVd
IGh0dHBzOi8vZ2l0aHViLmNvbS90ZWF3YXRlci9xZW11L3RyZWUvYmFsbG9vbl9jb250cwo+ID4+
IFs2XSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC81LzEzLzEyMTEKPiA+PiAKPiA+PiBIdWkg
Wmh1ICgyKToKPiA+PiAgdmlydGlvX2JhbGxvb246IEFkZCBWSVJUSU9fQkFMTE9PTl9GX0NPTlRf
UEFHRVMgYW5kIGluZmxhdGVfY29udF92cQo+ID4+ICB2aXJ0aW9fYmFsbG9vbjogQWRkIGRlZmxh
dGVfY29udF92cSB0byBkZWZsYXRlIGNvbnRpbnVvdXMgcGFnZXMKPiA+PiAKPiA+PiBkcml2ZXJz
L3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jICAgICB8ICAxODAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tCj4gPj4gaW5jbHVkZS9saW51eC9iYWxsb29uX2NvbXBhY3Rpb24uaCAg
fCAgIDEyICsrCj4gPj4gaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19iYWxsb29uLmggfCAgICAx
Cj4gPj4gbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMgICAgICAgICAgICAgfCAgMTE3ICsrKysrKysr
KysrKysrKysrKysrKy0tCj4gPj4gNCBmaWxlcyBjaGFuZ2VkLCAyODAgaW5zZXJ0aW9ucygrKSwg
MzAgZGVsZXRpb25zKC0pCj4gPiAKPiA+IAo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBUbyB1bnN1YnNj
cmliZSwgZS1tYWlsOiB2aXJ0aW8tZGV2LXVuc3Vic2NyaWJlQGxpc3RzLm9hc2lzLW9wZW4ub3Jn
Cj4gPiBGb3IgYWRkaXRpb25hbCBjb21tYW5kcywgZS1tYWlsOiB2aXJ0aW8tZGV2LWhlbHBAbGlz
dHMub2FzaXMtb3Blbi5vcmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
