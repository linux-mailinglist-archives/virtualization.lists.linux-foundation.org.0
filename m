Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13719F74F
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 15:55:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 95217230A1;
	Mon,  6 Apr 2020 13:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuiVviDiWOko; Mon,  6 Apr 2020 13:55:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7E9392155F;
	Mon,  6 Apr 2020 13:55:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6561DC0177;
	Mon,  6 Apr 2020 13:55:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DAE5C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 48585884FD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smAxbdeJW7yL
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:55:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5E457882EC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586181332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JbffD6uHYn0Xws8gEnJhH/ASm7vL5TTpW7bpIjfQF0=;
 b=EzslrJZp/4iBlCTZ6KdRzYAMj/qR36LQvepH1SWqRNGGgMiAgMSdO7cmzzAMICcBv63Lrf
 uPXXj4pktqn5plxtFc05FRdg0ljsJe7DBapir7TOYKyUP/PZPiY2DvIIvZC9CwDGLKIHQi
 jrKglBXqA3K9vgfMV6KAhg83Z1f3HaM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-IxvoZt0DMSCpFYZSd-6u1A-1; Mon, 06 Apr 2020 09:55:30 -0400
X-MC-Unique: IxvoZt0DMSCpFYZSd-6u1A-1
Received: by mail-wm1-f72.google.com with SMTP id e16so4142214wmh.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 06:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4JbffD6uHYn0Xws8gEnJhH/ASm7vL5TTpW7bpIjfQF0=;
 b=FRU1WBj/Or3rQxYb1rF1nAKdRNCzL28a+cJze8zV/08GGf02aHC82vx8U4DmmzHd2y
 kUHaYD/6rKGGej4nPTxMFNnJ+JX7aO1bfejPEyx+GeMs/TBjofeKE+1p0DhHwJiKy3bO
 Xz17bV3pyb3SBtCnEyTMkMpomFZnSPjvjKqbA4btrt8upErJfCSWT1syiajTAUpvPTjl
 LKJRjiKw/LICBM7u0u8hCJB2UtUn0fx+0V2EWXZdgf0nVn74mct1vZbMUtmdga67324k
 TwFD7FWbFmS0ncxOCoFh0OgdJAI4/osvScNo7KxSFEZOR4nkA9pHrKLpEgeHZ2yUhgyV
 Zc+g==
X-Gm-Message-State: AGi0PuYdmEJqE5Pc4xezAwJFzJQr77f3g/ngs/jQe2MTyk75KmMGK4O8
 e6LNbnm+k9hJ6/aUWgWgw8u/oGe1hF3XKS4MV4Gbo+IaGB6jfXXJJe9zFiNwbV97zivbRqS2i7b
 Bovm6XyhxNjqQIT0ZDEyu7bVh3tW4nh2jDc638ygfrw==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr602254wrt.292.1586181328771;
 Mon, 06 Apr 2020 06:55:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJMOX8DPPm6vlwNHfWsSuz0mrVkzWpGk7TU+nZhYELINvwWAIdcv57+eCeK2DYp6J7Z3YNU5w==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr602237wrt.292.1586181328553;
 Mon, 06 Apr 2020 06:55:28 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id w204sm25954947wma.1.2020.04.06.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 06:55:28 -0700 (PDT)
Date: Mon, 6 Apr 2020 09:55:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: force spec specified alignment on types
Message-ID: <20200406095424-mutt-send-email-mst@kernel.org>
References: <20200406124931.120768-1-mst@redhat.com>
 <045c84ed-151e-a850-9c72-5079bd2775e6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <045c84ed-151e-a850-9c72-5079bd2775e6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

T24gTW9uLCBBcHIgMDYsIDIwMjAgYXQgMDk6MzQ6MDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvNiDkuIvljYg4OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBUaGUgcmluZyBlbGVtZW50IGFkZHJlc3NlcyBhcmUgcGFzc2VkIGJldHdlZW4gY29tcG9u
ZW50cyB3aXRoIGRpZmZlcmVudAo+ID4gYWxpZ25tZW50cyBhc3N1bXB0aW9ucy4gVGh1cywgaWYg
Z3Vlc3QvdXNlcnNwYWNlIHNlbGVjdHMgYSBwb2ludGVyIGFuZAo+ID4gaG9zdCB0aGVuIGdldHMg
YW5kIGRlcmVmZXJlbmNlcyBpdCwgd2UgbWlnaHQgbmVlZCB0byBkZWNyZWFzZSB0aGUKPiA+IGNv
bXBpbGVyLXNlbGVjdGVkIGFsaWdubWVudCB0byBwcmV2ZW50IGNvbXBpbGVyIG9uIHRoZSBob3N0
IGZyb20KPiA+IGFzc3VtaW5nIHBvaW50ZXIgaXMgYWxpZ25lZC4KPiA+IAo+ID4gVGhpcyBhY3R1
YWxseSB0cmlnZ2VycyBvbiBBUk0gd2l0aCAtbWFiaT1hcGNzLWdudSAtIHdoaWNoIGlzIGEKPiA+
IGRlcHJlY2F0ZWQgY29uZmlndXJhdGlvbiwgYnV0IGl0IHNlZW1zIHNhZmVyIHRvIGhhbmRsZSB0
aGlzCj4gPiBnZW5lcmFsbHkuCj4gPiAKPiA+IEkgdmVyaWZpZWQgdGhhdCB0aGUgcHJvZHVjZWQg
YmluYXJ5IGlzIGV4YWN0bHkgaWRlbnRpY2FsIG9uIHg4Ni4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBU
aGlzIGlzIG15IHByZWZlcnJlZCB3YXkgdG8gaGFuZGxlIHRoZSBBUk0gaW5jb21wYXRpYmlsaXR5
IGlzc3Vlcwo+ID4gKGluIHByZWZlcmVuY2UgdG8ga2NvbmZpZyBoYWNrcykuCj4gPiBJIHdpbGwg
cHVzaCB0aGlzIGludG8gbmV4dCBub3cuCj4gPiBDb21tZW50cz8KPiAKPiAKPiBJJ20gbm90IHN1
cmUgaWYgaXQncyB0b28gbGF0ZSB0byBmaXguIEl0IHdvdWxkIHN0aWxsIGJlIHN0aWxsIHByb2Js
ZW1hdGljCj4gZm9yIHRoZSB1c2Vyc3BhY2UgdGhhdCBpcyB1c2luZyBvbGQgdWFwaSBoZWFkZXJz
Pwo+IAo+IFRoYW5rcwoKSXQncyBub3QgYSBwcm9ibGVtIGluIHVzZXJzcGFjZS4gVGhlIHByb2Js
ZW0gaXMgd2hlbgp1c2Vyc3BhY2UvZ3Vlc3QgdXNlcyAyIGJ5dGUgYWxpZ25tZW50IGFuZCBwYXNz
ZXMgaXQgdG8ga2VybmVsCmFzc3VtaW5nIDggYnl0ZSBhbGlnbm1lbnQuIFRoZSBmaXggaXMgZm9y
IGhvc3Qgbm90IHRvCm1ha2UgdGhlc2UgYXNzdW1wdGlvbnMuCgo+IAo+ID4gCj4gPiAgIGRyaXZl
cnMvdmhvc3Qvdmhvc3QuaCAgICAgICAgICAgIHwgIDYgKystLS0KPiA+ICAgaW5jbHVkZS91YXBp
L2xpbnV4L3ZpcnRpb19yaW5nLmggfCA0MSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5oIGIvZHJpdmVycy92
aG9zdC92aG9zdC5oCj4gPiBpbmRleCBjYzgyOTE4MTU4ZDIuLmE2N2JkYTk3OTJlYyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+ID4gKysrIGIvZHJpdmVycy92aG9zdC92
aG9zdC5oCj4gPiBAQCAtNzQsOSArNzQsOSBAQCBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlIHsKPiA+
ICAgCS8qIFRoZSBhY3R1YWwgcmluZyBvZiBidWZmZXJzLiAqLwo+ID4gICAJc3RydWN0IG11dGV4
IG11dGV4Owo+ID4gICAJdW5zaWduZWQgaW50IG51bTsKPiA+IC0Jc3RydWN0IHZyaW5nX2Rlc2Mg
X191c2VyICpkZXNjOwo+ID4gLQlzdHJ1Y3QgdnJpbmdfYXZhaWwgX191c2VyICphdmFpbDsKPiA+
IC0Jc3RydWN0IHZyaW5nX3VzZWQgX191c2VyICp1c2VkOwo+ID4gKwl2cmluZ19kZXNjX3QgX191
c2VyICpkZXNjOwo+ID4gKwl2cmluZ19hdmFpbF90IF9fdXNlciAqYXZhaWw7Cj4gPiArCXZyaW5n
X3VzZWRfdCBfX3VzZXIgKnVzZWQ7Cj4gPiAgIAljb25zdCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbWFw
ICptZXRhX2lvdGxiW1ZIT1NUX05VTV9BRERSU107Cj4gPiAgIAlzdHJ1Y3Qgdmhvc3RfZGVzYyAq
ZGVzY3M7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgg
Yi9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX3JpbmcuaAo+ID4gaW5kZXggNTU5ZjQyZTczMzE1
Li5jZDZlMGIyZWFmMmYgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlv
X3JpbmcuaAo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgKPiA+IEBA
IC0xMTgsMTYgKzExOCw2IEBAIHN0cnVjdCB2cmluZ191c2VkIHsKPiA+ICAgCXN0cnVjdCB2cmlu
Z191c2VkX2VsZW0gcmluZ1tdOwo+ID4gICB9Owo+ID4gLXN0cnVjdCB2cmluZyB7Cj4gPiAtCXVu
c2lnbmVkIGludCBudW07Cj4gPiAtCj4gPiAtCXN0cnVjdCB2cmluZ19kZXNjICpkZXNjOwo+ID4g
LQo+ID4gLQlzdHJ1Y3QgdnJpbmdfYXZhaWwgKmF2YWlsOwo+ID4gLQo+ID4gLQlzdHJ1Y3QgdnJp
bmdfdXNlZCAqdXNlZDsKPiA+IC19Owo+ID4gLQo+ID4gICAvKiBBbGlnbm1lbnQgcmVxdWlyZW1l
bnRzIGZvciB2cmluZyBlbGVtZW50cy4KPiA+ICAgICogV2hlbiB1c2luZyBwcmUtdmlydGlvIDEu
MCBsYXlvdXQsIHRoZXNlIGZhbGwgb3V0IG5hdHVyYWxseS4KPiA+ICAgICovCj4gPiBAQCAtMTY0
LDYgKzE1NCwzNyBAQCBzdHJ1Y3QgdnJpbmcgewo+ID4gICAjZGVmaW5lIHZyaW5nX3VzZWRfZXZl
bnQodnIpICgodnIpLT5hdmFpbC0+cmluZ1sodnIpLT5udW1dKQo+ID4gICAjZGVmaW5lIHZyaW5n
X2F2YWlsX2V2ZW50KHZyKSAoKihfX3ZpcnRpbzE2ICopJih2ciktPnVzZWQtPnJpbmdbKHZyKS0+
bnVtXSkKPiA+ICsvKgo+ID4gKyAqIFRoZSByaW5nIGVsZW1lbnQgYWRkcmVzc2VzIGFyZSBwYXNz
ZWQgYmV0d2VlbiBjb21wb25lbnRzIHdpdGggZGlmZmVyZW50Cj4gPiArICogYWxpZ25tZW50cyBh
c3N1bXB0aW9ucy4gVGh1cywgd2UgbWlnaHQgbmVlZCB0byBkZWNyZWFzZSB0aGUgY29tcGlsZXIt
c2VsZWN0ZWQKPiA+ICsgKiBhbGlnbm1lbnQsIGFuZCBzbyBtdXN0IHVzZSBhIHR5cGVkZWYgdG8g
bWFrZSBzdXJlIHRoZSBfX2FsaWduZWQgYXR0cmlidXRlCj4gPiArICogYWN0dWFsbHkgdGFrZXMg
aG9sZDoKPiA+ICsgKgo+ID4gKyAqIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy8vZ2Nj
L0NvbW1vbi1UeXBlLUF0dHJpYnV0ZXMuaHRtbCNDb21tb24tVHlwZS1BdHRyaWJ1dGVzCj4gPiAr
ICoKPiA+ICsgKiBXaGVuIHVzZWQgb24gYSBzdHJ1Y3QsIG9yIHN0cnVjdCBtZW1iZXIsIHRoZSBh
bGlnbmVkIGF0dHJpYnV0ZSBjYW4gb25seQo+ID4gKyAqIGluY3JlYXNlIHRoZSBhbGlnbm1lbnQ7
IGluIG9yZGVyIHRvIGRlY3JlYXNlIGl0LCB0aGUgcGFja2VkIGF0dHJpYnV0ZSBtdXN0Cj4gPiAr
ICogYmUgc3BlY2lmaWVkIGFzIHdlbGwuIFdoZW4gdXNlZCBhcyBwYXJ0IG9mIGEgdHlwZWRlZiwg
dGhlIGFsaWduZWQgYXR0cmlidXRlCj4gPiArICogY2FuIGJvdGggaW5jcmVhc2UgYW5kIGRlY3Jl
YXNlIGFsaWdubWVudCwgYW5kIHNwZWNpZnlpbmcgdGhlIHBhY2tlZAo+ID4gKyAqIGF0dHJpYnV0
ZSBnZW5lcmF0ZXMgYSB3YXJuaW5nLgo+ID4gKyAqLwo+ID4gK3R5cGVkZWYgc3RydWN0IHZyaW5n
X2Rlc2MgX19hdHRyaWJ1dGVfXygoYWxpZ25lZChWUklOR19ERVNDX0FMSUdOX1NJWkUpKSkKPiA+
ICsJdnJpbmdfZGVzY190Owo+ID4gK3R5cGVkZWYgc3RydWN0IHZyaW5nX2F2YWlsIF9fYXR0cmli
dXRlX18oKGFsaWduZWQoVlJJTkdfQVZBSUxfQUxJR05fU0laRSkpKQo+ID4gKwl2cmluZ19hdmFp
bF90Owo+ID4gK3R5cGVkZWYgc3RydWN0IHZyaW5nX3VzZWQgX19hdHRyaWJ1dGVfXygoYWxpZ25l
ZChWUklOR19VU0VEX0FMSUdOX1NJWkUpKSkKPiA+ICsJdnJpbmdfdXNlZF90Owo+ID4gKwo+ID4g
K3N0cnVjdCB2cmluZyB7Cj4gPiArCXVuc2lnbmVkIGludCBudW07Cj4gPiArCj4gPiArCXZyaW5n
X2Rlc2NfdCAqZGVzYzsKPiA+ICsKPiA+ICsJdnJpbmdfYXZhaWxfdCAqYXZhaWw7Cj4gPiArCj4g
PiArCXZyaW5nX3VzZWRfdCAqdXNlZDsKPiA+ICt9Owo+ID4gKwo+ID4gICBzdGF0aWMgaW5saW5l
IHZvaWQgdnJpbmdfaW5pdChzdHJ1Y3QgdnJpbmcgKnZyLCB1bnNpZ25lZCBpbnQgbnVtLCB2b2lk
ICpwLAo+ID4gICAJCQkgICAgICB1bnNpZ25lZCBsb25nIGFsaWduKQo+ID4gICB7CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
