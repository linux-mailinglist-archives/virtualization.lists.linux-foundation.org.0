Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DC193C41
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 10:50:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCD5687179;
	Thu, 26 Mar 2020 09:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07apOQeaZOxB; Thu, 26 Mar 2020 09:50:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D8DA87100;
	Thu, 26 Mar 2020 09:50:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E892C0177;
	Thu, 26 Mar 2020 09:50:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DCF3C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 51B53215DF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qAOZhQFJcFe
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:50:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by silver.osuosl.org (Postfix) with ESMTPS id 231D220408
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585216198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSdLnkX5cWkW77BXDTK3F4eLxqaTUjnvmwt+R66r9DM=;
 b=bGlLOWQe9EZb3oJzmaeQ0fLrlo6SQ99DGosXW2MH96Q7FAuMNmn/LdwABUHPnz/U4YUqUo
 5jTXUBROOmcngExvXPQ85npuZrJTVxMLsOJxKzvxaWD9xNkAsWuW9MFvYpJ+qcIBcyzM4f
 N4v/RH9DcIhAAevkYB3/7yWz4/y2rq4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-woQzrGG_N8izyawmsuzTuA-1; Thu, 26 Mar 2020 05:49:57 -0400
X-MC-Unique: woQzrGG_N8izyawmsuzTuA-1
Received: by mail-wm1-f71.google.com with SMTP id m4so3714529wme.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 02:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NSdLnkX5cWkW77BXDTK3F4eLxqaTUjnvmwt+R66r9DM=;
 b=mBBJ/YH3yKcWNObznrIqslvg7e79ycJPDniD/jiGl5D9vn9DfWGGvFfqgac96dSAoe
 9MCalp5gqCWJDAAV7C/peMTyI10PCHfIqIeBVYS+NfYmzRPRrAKNzScl5v1kupPh4Q72
 4S50un0Kwz8TeH1XKerFVIy6sgtXhxZPUNtlJ8QRD07+8AAxoGYlO64pgj10umCJltr/
 C76WNav19/Ed311Lh0rhr9dsBsnbDPGMxvIweMaOwE0dsKZfKcabU1f1sBs9EvFyH2B2
 4Belsjsnulh/xdEiGRqJhkZRT0bPealCt7lRWLs1/S9c616KHhUK95aOUXZxSUvcvT80
 bGPA==
X-Gm-Message-State: ANhLgQ3F2g00D7JuMAqQnXvn9EhkFIyBpN2zEU6gkySrAaZ0vzjX5/fV
 gKLOeJl5kIWutXkXGCHhOULNDrEGEu3nO3Wlt2VflVTqdm2GQSh2/9PbvYJQWCtX1RaFd2QkXZM
 WpTGVeCqmJG03hFp0nw2GnGbG84/ZuPrujLKW/sjKeQ==
X-Received: by 2002:a05:600c:54d:: with SMTP id
 k13mr2200280wmc.161.1585216195792; 
 Thu, 26 Mar 2020 02:49:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vthiOYCqhaQ4ipeqgslIrJP5TXRiX5GolPTyZ0QmSXOrjZV02Xrn9oHBY26s1ICvZAq9CZzAQ==
X-Received: by 2002:a05:600c:54d:: with SMTP id
 k13mr2200244wmc.161.1585216195492; 
 Thu, 26 Mar 2020 02:49:55 -0700 (PDT)
Received: from redhat.com (bzq-79-182-20-254.red.bezeqint.net. [79.182.20.254])
 by smtp.gmail.com with ESMTPSA id 9sm2667566wmm.6.2020.03.26.02.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:49:54 -0700 (PDT)
Date: Thu, 26 Mar 2020 05:49:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200326054554-mutt-send-email-mst@kernel.org>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
MIME-Version: 1.0
In-Reply-To: <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

T24gVGh1LCBNYXIgMjYsIDIwMjAgYXQgMDg6NTQ6MDRBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gCj4gCj4gPiBBbSAyNi4wMy4yMDIwIHVtIDA4OjIxIHNjaHJpZWIgTWljaGFl
bCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT46Cj4gPiAKPiA+IO+7v09uIFRodSwgTWFyIDEy
LCAyMDIwIGF0IDA5OjUxOjI1QU0gKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+
PiBPbiAxMi4wMy4yMCAwOTo0NywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4+PiBPbiBU
aHUsIE1hciAxMiwgMjAyMCBhdCAwOTozNzozMkFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3
cm90ZToKPiA+Pj4+IDIuIFlvdSBhcmUgZXNzZW50aWFsbHkgc3RlYWxpbmcgVEhQcyBpbiB0aGUg
Z3Vlc3QuIFNvIHRoZSBmYXN0ZXN0Cj4gPj4+PiBtYXBwaW5nIChUSFAgaW4gZ3Vlc3QgYW5kIGhv
c3QpIGlzIGdvbmUuIFRoZSBndWVzdCB3b24ndCBiZSBhYmxlIHRvIG1ha2UKPiA+Pj4+IHVzZSBv
ZiBUSFAgd2hlcmUgaXQgcHJldmlvdXNseSB3YXMgYWJsZSB0by4gSSBjYW4gaW1hZ2luZSB0aGlz
IGltcGxpZXMgYQo+ID4+Pj4gcGVyZm9ybWFuY2UgZGVncmFkYXRpb24gZm9yIHNvbWUgd29ya2xv
YWRzLiBUaGlzIG5lZWRzIGEgcHJvcGVyCj4gPj4+PiBwZXJmb3JtYW5jZSBldmFsdWF0aW9uLgo+
ID4+PiAKPiA+Pj4gSSB0aGluayB0aGUgcHJvYmxlbSBpcyBtb3JlIHdpdGggdGhlIGFsbG9jX3Bh
Z2VzIEFQSS4KPiA+Pj4gVGhhdCBnaXZlcyB5b3UgZXhhY3RseSB0aGUgZ2l2ZW4gb3JkZXIsIGFu
ZCBpZiB0aGVyZSdzCj4gPj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJsZSwgaXQgd2lsbCBzcGxp
dCBpdCB1cC4KPiA+Pj4gCj4gPj4+IEJ1dCBmb3IgYmFsbG9vbiAtIEkgc3VzcGVjdCBsb3RzIG9m
IG90aGVyIHVzZXJzLAo+ID4+PiB3ZSBkbyBub3Qgd2FudCB0byBzdHJlc3MgdGhlIHN5c3RlbSBi
dXQgaWYgYSBsYXJnZQo+ID4+PiBjaHVuayBpcyBhdmFpbGFibGUgYW55d2F5LCB0aGVuIHdlIGNv
dWxkIGhhbmRsZQo+ID4+PiB0aGF0IG1vcmUgb3B0aW1hbGx5IGJ5IGdldHRpbmcgaXQgYWxsIGlu
IG9uZSBnby4KPiA+Pj4gCj4gPj4+IAo+ID4+PiBTbyBpZiB3ZSB3YW50IHRvIGFkZHJlc3MgdGhp
cywgSU1ITyB0aGlzIGNhbGxzIGZvciBhIG5ldyBBUEkuCj4gPj4+IEFsb25nIHRoZSBsaW5lcyBv
Zgo+ID4+PiAKPiA+Pj4gICAgc3RydWN0IHBhZ2UgKmFsbG9jX3BhZ2VfcmFuZ2UoZ2ZwX3QgZ2Zw
LCB1bnNpZ25lZCBpbnQgbWluX29yZGVyLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IG1heF9vcmRlciwgdW5zaWduZWQgaW50ICpvcmRlcikKPiA+Pj4gCj4gPj4+IHRoZSBp
ZGVhIHdvdWxkIHRoZW4gYmUgdG8gcmV0dXJuIGF0IGEgbnVtYmVyIG9mIHBhZ2VzIGluIHRoZSBn
aXZlbgo+ID4+PiByYW5nZS4KPiA+Pj4gCj4gPj4+IFdoYXQgZG8geW91IHRoaW5rPyBXYW50IHRv
IHRyeSBpbXBsZW1lbnRpbmcgdGhhdD8KPiA+PiAKPiA+PiBZb3UgY2FuIGp1c3Qgc3RhcnQgd2l0
aCB0aGUgaGlnaGVzdCBvcmRlciBhbmQgZGVjcmVtZW50IHRoZSBvcmRlciB1bnRpbAo+ID4+IHlv
dXIgYWxsb2NhdGlvbiBzdWNjZWVkcyB1c2luZyBhbGxvY19wYWdlcygpLCB3aGljaCB3b3VsZCBi
ZSBlbm91Z2ggZm9yCj4gPj4gYSBmaXJzdCB2ZXJzaW9uLiBBdCBsZWFzdCBJIGRvbid0IHNlZSB0
aGUgaW1tZWRpYXRlIG5lZWQgZm9yIGEgbmV3Cj4gPj4ga2VybmVsIEFQSS4KPiA+IAo+ID4gT0sg
SSByZW1lbWJlciBub3cuICBUaGUgcHJvYmxlbSBpcyB3aXRoIHJlY2xhaW0uIFVubGVzcyByZWNs
YWltIGlzCj4gPiBjb21wbGV0ZWx5IGRpc2FibGVkLCBhbnkgb2YgdGhlc2UgY2FsbHMgY2FuIHNs
ZWVwLiBBZnRlciBpdCB3YWtlcyB1cCwKPiA+IHdlIHdvdWxkIGxpa2UgdG8gZ2V0IHRoZSBsYXJn
ZXIgb3JkZXIgdGhhdCBoYXMgYmVjb21lIGF2YWlsYWJsZQo+ID4gbWVhbndoaWxlLgo+ID4gCj4g
Cj4gWWVzLCBidXQgdGhhdOKAmHMgYSBwdXJlIG9wdGltaXphdGlvbiBJTUhPLgo+IFNvIEkgdGhp
bmsgd2Ugc2hvdWxkIGRvIGEgdHJpdmlhbCBpbXBsZW1lbnRhdGlvbiBmaXJzdCBhbmQgdGhlbiBz
ZWUgd2hhdCB3ZSBnYWluIGZyb20gYSBuZXcgYWxsb2NhdG9yIEFQSS4gVGhlbiB3ZSBtaWdodCBh
bHNvIGJlIGFibGUgdG8ganVzdGlmeSBpdCB1c2luZyByZWFsIG51bWJlcnMuCj4gCgpXZWxsIGhv
dyBkbyB5b3UgcHJvcG9zZSBpbXBsZW1lbnQgdGhlIG5lY2Vzc2FyeSBzZW1hbnRpY3M/CkkgdGhp
bmsgd2UgYXJlIGJvdGggYWdyZWVkIHRoYXQgYWxsb2NfcGFnZV9yYW5nZSBpcyBtb3JlIG9yCmxl
c3Mgd2hhdCdzIG5lY2Vzc2FyeSBhbnl3YXkgLSBzbyBob3cgd291bGQgeW91IGFwcHJveGltYXRl
IGl0Cm9uIHRvcCBvZiBleGlzdGluZyBBUElzPwoKCj4gPiAKPiA+PiAtLSAKPiA+PiBUaGFua3Ms
Cj4gPj4gCj4gPj4gRGF2aWQgLyBkaGlsZGVuYgo+ID4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
