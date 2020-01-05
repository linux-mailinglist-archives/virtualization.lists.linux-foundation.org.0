Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC111307A2
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 12:16:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7F50203AB;
	Sun,  5 Jan 2020 11:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmCNeBC7+awg; Sun,  5 Jan 2020 11:16:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B92A520034;
	Sun,  5 Jan 2020 11:16:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96D4CC0881;
	Sun,  5 Jan 2020 11:16:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3200BC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 11:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B0AA203AB
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 11:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJGs5k4srdwF
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 11:16:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id B127820034
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578222999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GGlSSbeC4Kbhr61r3dRU9qa1eVoeraY/lQ162mo0Jg=;
 b=WtHbvrcnb7uj/nbsnYYHVHjmVdQ9yrNOKlV0Kq+ZP3LErUs8VCq1UHFdIiQetc5KKxHxgi
 jWDusYJ0aPYIxL8tsbZnmOwbi2QcMcQLy+6OeVfLRd8x8FLY3FPbxeD8m5DGjL0qghYxKa
 UUwyRYgGOifxfwJPRoJoeUAUBS0Ry80=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-o5Bl0QNmO8Ko9y6HuJuDOw-1; Sun, 05 Jan 2020 06:16:37 -0500
Received: by mail-qk1-f200.google.com with SMTP id f22so7742124qka.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jan 2020 03:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+GGlSSbeC4Kbhr61r3dRU9qa1eVoeraY/lQ162mo0Jg=;
 b=Qh4mN8e3DigTw7cYkBiX2aDQCPy6r754zJI4UTYYhl9Bw9hbQp96i5lBubENsWQcoy
 eoOca0yn5wENEvYWb3g/XrxaA8e7FhV2CO+YZ+Y+VYSu7QbdC3ruOcHKvcJHnVyh5vfc
 vzWYng0J2Wrxy2B4QqjKrXb0rDIk0nG9Uy76E0wNbZE2b6mTWoiHVlaCK2c9f02dZAhV
 rGCGV04PsU45V5KpNnwVuVthL3uz8RrkiDHS0lZLswcrj/F5/Hn4TTnHs7bxCqaGFX2e
 SXG2O4PRIyUq/Y25Q0VS1NZ1P4BMMhX/ZGNhxVi1AaJveevzlukcWmeIYMuk2rgFN/xE
 BptA==
X-Gm-Message-State: APjAAAXoBYkKY/miKUzfaLq7CK9wkEo6rw0yUaN+TlTy3a8/TD1nHNBK
 SX3jkVdpsEjajR8TW48b4Ay3aqcMHugpsbzs+Rv7RmDFC0aq6JGSU7SZRr7uJ1QXruGYlpu+5AJ
 pmdrZvDnugcNJosorVFQuoER2uhT+tZ+w3Th/6JV3QQ==
X-Received: by 2002:a37:68d5:: with SMTP id
 d204mr78760683qkc.171.1578222997285; 
 Sun, 05 Jan 2020 03:16:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPMMvBqmBN4Gem7zky32ejHiDxpzbcW8rhw1eSZVpEgSTWT6x4f+E8PIcPfp2MrIjZ3t+TIA==
X-Received: by 2002:a37:68d5:: with SMTP id
 d204mr78760671qkc.171.1578222996963; 
 Sun, 05 Jan 2020 03:16:36 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id t7sm19125131qkm.136.2020.01.05.03.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 03:16:36 -0800 (PST)
Date: Sun, 5 Jan 2020 06:16:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20200105061532-mutt-send-email-mst@kernel.org>
References: <20191223140322.20013-1-mst@redhat.com>
 <CANDihLHPk5khpv-f-M+qhkzgTkygAts38GGb-HChg-VL2bo+Uw@mail.gmail.com>
 <CA+FuTSfq5v3-0VYmTG7YFFUqT8uG53eXXhqc8WvVvMbp3s0nvA@mail.gmail.com>
 <CA+FuTScwwajN2ny2w8EBkBQd191Eb1ZsrRhbh3=5eQervArnEA@mail.gmail.com>
 <CANDihLFv+DJYOD1m_Z3CKuxoXG-z4zPy_Tc2eoggq1KRo+GeWw@mail.gmail.com>
 <ea5131fc-cda6-c773-73fc-c862be6ecb7b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ea5131fc-cda6-c773-73fc-c862be6ecb7b@redhat.com>
X-MC-Unique: o5Bl0QNmO8Ko9y6HuJuDOw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Alistair Delva <adelva@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMTA6NDk6MTNBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzEyLzI0IOS4iuWNiDQ6MjEsIEFsaXN0YWlyIERlbHZhIHdyb3RlOgo+
ID4gT24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMTI6MTIgUE0gV2lsbGVtIGRlIEJydWlqbgo+ID4g
PHdpbGxlbWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBPbiBNb24sIERl
YyAyMywgMjAxOSBhdCAyOjU2IFBNIFdpbGxlbSBkZSBCcnVpam4KPiA+ID4gPHdpbGxlbWRlYnJ1
aWpuLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IDAwZmZmZTBmZjAgRFI3OiAwMDAw
MDAwMDAwMDAwNDAwCj4gPiA+ID4gPiA+IENhbGwgVHJhY2U6Cj4gPiA+ID4gPiA+ICAgPyBwcmVl
bXB0X2NvdW50X2FkZCsweDU4LzB4YjAKPiA+ID4gPiA+ID4gICA/IF9yYXdfc3Bpbl9sb2NrX2ly
cXNhdmUrMHgzNi8weDcwCj4gPiA+ID4gPiA+ICAgPyBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3Rv
cmUrMHgxYS8weDQwCj4gPiA+ID4gPiA+ICAgPyBfX3dha2VfdXArMHg3MC8weDE5MAo+ID4gPiA+
ID4gPiAgIHZpcnRuZXRfc2V0X2ZlYXR1cmVzKzB4OTAvMHhmMCBbdmlydGlvX25ldF0KPiA+ID4g
PiA+ID4gICBfX25ldGRldl91cGRhdGVfZmVhdHVyZXMrMHgyNzEvMHg5ODAKPiA+ID4gPiA+ID4g
ICA/IG5sbXNnX25vdGlmeSsweDViLzB4YTAKPiA+ID4gPiA+ID4gICBkZXZfZGlzYWJsZV9scm8r
MHgyYi8weDE5MAo+ID4gPiA+ID4gPiAgID8gaW5ldF9uZXRjb25mX25vdGlmeV9kZXZjb25mKzB4
ZTIvMHgxMjAKPiA+ID4gPiA+ID4gICBkZXZpbmV0X3N5c2N0bF9mb3J3YXJkKzB4MTc2LzB4MWUw
Cj4gPiA+ID4gPiA+ICAgcHJvY19zeXNfY2FsbF9oYW5kbGVyKzB4MWYwLzB4MjUwCj4gPiA+ID4g
PiA+ICAgcHJvY19zeXNfd3JpdGUrMHhmLzB4MjAKPiA+ID4gPiA+ID4gICBfX3Zmc193cml0ZSsw
eDNlLzB4MTkwCj4gPiA+ID4gPiA+ICAgPyBfX3NiX3N0YXJ0X3dyaXRlKzB4NmQvMHhkMAo+ID4g
PiA+ID4gPiAgIHZmc193cml0ZSsweGQzLzB4MTkwCj4gPiA+ID4gPiA+ICAga3N5c193cml0ZSsw
eDY4LzB4ZDAKPiA+ID4gPiA+ID4gICBfX2lhMzJfc3lzX3dyaXRlKzB4MTQvMHgyMAo+ID4gPiA+
ID4gPiAgIGRvX2Zhc3Rfc3lzY2FsbF8zMisweDg2LzB4ZTAKPiA+ID4gPiA+ID4gICBlbnRyeV9T
WVNFTlRFUl9jb21wYXQrMHg3Yy8weDhlCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBIHNpbWls
YXIgY3Jhc2ggd2lsbCBsaWtlbHkgdHJpZ2dlciB3aGVuIGVuYWJsaW5nIFhEUC4KPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBBbGlzdGFpciBEZWx2YSA8YWRlbHZhQGdvb2ds
ZS5jb20+Cj4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBXaWxsZW0gZGUgQnJ1aWpuIDx3aWxsZW1k
ZWJydWlqbi5rZXJuZWxAZ21haWwuY29tPgo+ID4gPiA+ID4gPiBGaXhlczogM2Y5MzUyMmZmYWIy
ICgidmlydGlvLW5ldDogc3dpdGNoIG9mZiBvZmZsb2FkcyBvbiBkZW1hbmQgaWYgcG9zc2libGUg
b24gWERQIHNldCIpCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtp
biA8bXN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gTGlnaHRseSB0ZXN0ZWQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBbGlzdGFpciwgY291
bGQgeW91IHBsZWFzZSB0ZXN0IGFuZCBjb25maXJtIHRoYXQgdGhpcyByZXNvbHZlcyB0aGUKPiA+
ID4gPiA+ID4gY3Jhc2ggZm9yIHlvdT8KPiA+ID4gPiA+IFRoaXMgcGF0Y2ggZG9lc24ndCB3b3Jr
LiBUaGUgcmVhc29uIGlzIHRoYXQgTkVUSUZfRl9MUk8gaXMgYWxzbyB0dXJuZWQKPiA+ID4gPiA+
IG9uIGJ5IFRTTzQvVFNPNiwgd2hpY2ggeW91ciBwYXRjaCBkaWRuJ3QgY2hlY2sgZm9yLiBTbyBp
dCBlbmRzIHVwCj4gPiA+ID4gPiBnb2luZyB0aHJvdWdoIHRoZSBzYW1lIHBhdGggYW5kIGNyYXNo
aW5nIGluIHRoZSBzYW1lIHdheS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgICAgICAgaWYgKHZp
cnRpb19oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9fTkVUX0ZfR1VFU1RfVFNPNCkgfHwKPiA+ID4g
PiA+ICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmRldiwgVklSVElPX05FVF9GX0dV
RVNUX1RTTzYpKQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICBkZXYtPmZlYXR1cmVzIHw9IE5F
VElGX0ZfTFJPOwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJdCBzb3VuZHMgbGlrZSB0aGlzIHBhdGNo
IGlzIGZpeGluZyBzb21ldGhpbmcgc2xpZ2h0bHkgZGlmZmVyZW50bHkgdG8KPiA+ID4gPiA+IG15
IHBhdGNoIGZpeGVkLiB2aXJ0bmV0X3NldF9mZWF0dXJlcygpIGRvZXNuJ3QgY2FyZSBhYm91dAo+
ID4gPiA+ID4gR1VFU1RfT0ZGTE9BRFMsIGl0IG9ubHkgdGVzdHMgYWdhaW5zdCBORVRJRl9GX0xS
Ty4gRXZlbiBpZiAib2ZmbG9hZHMiCj4gPiA+ID4gPiBpcyB6ZXJvLCBpdCB3aWxsIGNhbGwgdmly
dG5ldF9zZXRfZ3Vlc3Rfb2ZmbG9hZHMoKSwgd2hpY2ggdHJpZ2dlcnMgdGhlCj4gPiA+ID4gPiBj
cmFzaC4KPiA+ID4gPiAKPiA+ID4gPiBJbnRlcmVzdGluZy4gSXQncyBzdXJwcmlzaW5nIHRoYXQg
aXQgaXMgdHJ5aW5nIHRvIGNvbmZpZ3VyZSBhIGZsYWcKPiA+ID4gPiB0aGF0IGlzIG5vdCBjb25m
aWd1cmFibGUsIGkuZS4sIGFic2VudCBmcm9tIGRldi0+aHdfZmVhdHVyZXMKPiA+ID4gPiBhZnRl
ciBNaWNoYWVsJ3MgY2hhbmdlLgo+ID4gPiA+IAo+ID4gPiA+ID4gU28gZWl0aGVyIHdlIG5lZWQg
dG8gZW5zdXJlIE5FVElGX0ZfTFJPIGlzIG5ldmVyIHNldCwgb3IKPiA+ID4gPiBMUk8gbWlnaHQg
YmUgYXZhaWxhYmxlLCBqdXN0IG5vdCBjb25maWd1cmFibGUuIEluZGVlZCB0aGlzIHdhcyB3aGF0
IEkKPiA+ID4gPiBvYnNlcnZlZCBpbiB0aGUgcGFzdC4KPiA+ID4gZGV2X2Rpc2FibGVfbHJvIGV4
cGVjdHMgdGhhdCBORVRJRl9GX0xSTyBpcyBhbHdheXMgY29uZmlndXJhYmxlLiBXaGljaAo+ID4g
PiBJIGd1ZXNzIGlzIGEgcmVhc29uYWJsZSBhc3N1bXB0aW9uLCBqdXN0IG5vdCBuZWNlc3Nhcmls
eSB0aGUgY2FzZSBpbgo+ID4gPiB2aXJ0aW9fbmV0Lgo+ID4gPiAKPiA+ID4gU28gSSB0aGluayB3
ZSBuZWVkIGJvdGggcGF0Y2hlcy4gQ29ycmVjdGx5IG1hcmsgdGhlIGZlYXR1cmUgYXMgZml4ZWQK
PiA+ID4gYnkgcmVtb3ZpbmcgZnJvbSBkZXYtPmh3X2ZlYXR1cmVzIGFuZCBhbHNvIGlnbm9yZSB0
aGUgcmVxdWVzdCBmcm9tCj4gPiA+IGRldl9kaXNhYmxlX2xybywgd2hpY2ggZG9lcyBub3QgY2hl
Y2sgZm9yIHRoaXMuCj4gPiBTb21ldGhpbmcgbGlrZSB0aGlzIG1heWJlOgo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jCj4gPiBpbmRleCA0ZDdkNTQzNGNjNWQuLjA1NTZmNDJiMGZiNSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jCj4gPiBAQCAtMjU2MCw2ICsyNTYwLDkgQEAgc3RhdGljIGludCB2aXJ0bmV0X3NldF9mZWF0
dXJlcyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gICAgICAgICAgdTY0IG9mZmxvYWRzOwo+
ID4gICAgICAgICAgaW50IGVycjsKPiA+IAo+ID4gKyAgICAgICBpZiAoIXZpcnRpb19oYXNfZmVh
dHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMpKQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gICAgICAgICAgaWYgKChkZXYtPmZlYXR1
cmVzIF4gZmVhdHVyZXMpICYgTkVUSUZfRl9MUk8pIHsKPiA+ICAgICAgICAgICAgICAgICAgaWYg
KHZpLT54ZHBfcXVldWVfcGFpcnMpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FQlVTWTsKPiA+IEBAIC0yOTcxLDYgKzI5NzQsMTUgQEAgc3RhdGljIGludCB2aXJ0bmV0X3Zh
bGlkYXRlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gICAgICAgICAgaWYgKCF2aXJ0
bmV0X3ZhbGlkYXRlX2ZlYXR1cmVzKHZkZXYpKQo+ID4gICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+IAo+ID4gKyAgICAgICAvKiBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZM
T0FEUyBkb2VzIG5vdCB3b3JrIHdpdGhvdXQKPiA+ICsgICAgICAgICogVklSVElPX05FVF9GX0NU
UkxfVlEuIEhvd2V2ZXIgdGhlIHZpcnRpbyBzcGVjIGRvZXMgbm90Cj4gPiArICAgICAgICAqIHNw
ZWNpZnkgdGhhdCBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUyBkZXBlbmRzCj4gPiAr
ICAgICAgICAqIG9uIFZJUlRJT19ORVRfRl9DVFJMX1ZRIHNvIGRldmljZXMgY2FuIHNldCB0aGUg
bGF0ZXIgYnV0Cj4gPiArICAgICAgICAqIG5vdCB0aGUgZm9ybWVyLgo+ID4gKyAgICAgICAgKi8K
PiA+ICsgICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUodmRldiwgVklSVElPX05FVF9GX0NU
UkxfVlEpKQo+ID4gKyAgICAgICAgICAgICAgIF9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBWSVJU
SU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUyk7Cj4gPiArCj4gPiAgICAgICAgICBpZiAodmly
dGlvX2hhc19mZWF0dXJlKHZkZXYsIFZJUlRJT19ORVRfRl9NVFUpKSB7Cj4gPiAgICAgICAgICAg
ICAgICAgIGludCBtdHUgPSB2aXJ0aW9fY3JlYWQxNih2ZGV2LAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IHZpcnRpb19uZXRfY29u
ZmlnLAo+ID4gCj4gCj4gV2UgY2hlY2sgZmVhdHVyZSBkZXBlbmRlbmN5IGFuZCBmYWlsIHRoZSBw
cm9iZSBpbgo+IHZpcnRuZXRfdmFsaWRhdGVfZmVhdHVyZXMoKS4KPiAKPiBJcyBpdCBtb3JlIHN0
cmFpZ2h0Zm9yd2FyZCB0byBmYWlsIHRoZSBwcm9iZSB0aGVyZSB3aGVuIENUUkxfR1VFU1RfT0ZG
TE9BRFMKPiB3YXMgc2V0IGJ1dCBDVFJMX1ZRIHdhc24ndD8KPiAKPiBUaGFua3MKCkV4cGFuZGlu
ZyBvbiB3aGF0IHRoZSBjb21tZW50IGFib3ZlIHNheXMsIHdlIGNhbid0IGZhaWwgcHJvYmUKaW4g
dGhpcyBjb25maWd1cmF0aW9uIHdpdGhvdXQgYnJlYWtpbmcgdGhlIGRyaXZlciBmb3IKc3BlYyBj
b21wbGlhbnQgZGV2aWNlcy4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
