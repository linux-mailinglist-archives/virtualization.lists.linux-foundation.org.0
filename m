Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF119C13D
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 14:37:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1760A87A0A;
	Thu,  2 Apr 2020 12:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBS2k0zxVYCZ; Thu,  2 Apr 2020 12:37:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E1B1879A6;
	Thu,  2 Apr 2020 12:37:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21E9CC07FF;
	Thu,  2 Apr 2020 12:37:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B195C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CB2D4204BA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsSaEvdKXOmN
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:37:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 190CA20104
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585831041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z83ZFN7U6iOT0EPOREo66Rtq033CFmiu/su55XugOps=;
 b=XHSvVe8kGfeUTcKC1dODE8gKohFTfGq3A0I70xaU5tBbEDwuFauMF+RVm4aqFArj3PByxv
 9Gg8bSLWGwmbRcoUXjK05IioKdaHlhe81KxzwQbKhzbvSGMgdUbQUa0izvWJ6ZaJjql11I
 rWU3CYZEUDTmldWCtVOWv8MkiTQlZE4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-VLQC92PQPyqQk00LKFxvzQ-1; Thu, 02 Apr 2020 08:37:20 -0400
X-MC-Unique: VLQC92PQPyqQk00LKFxvzQ-1
Received: by mail-qv1-f71.google.com with SMTP id w7so2519432qvu.16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 05:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z83ZFN7U6iOT0EPOREo66Rtq033CFmiu/su55XugOps=;
 b=aXdVxBQAoryNvLZ4e/KLU6c44auHTtrlqKRrzX+PmKFsKE1D/95p8LgqWEJlrjQgh0
 boXQArLNZxmQmi+J6hGkUFOwjnBr4igd2Pgb5S3g87+pjkYkQh7fAsEXypAqRT3Q5gBm
 zXw1jIKopGsgqdaQvDMuTovjoFXAQKrg0wACdrCZPSwWUsj8f4Ir68dt7BEnMiEK22M3
 9E1kV+TeY8c0KUtEtX1y3pm9iq+IUrzjCEkU9lDsdmgDyZOZdzwhnzwqLUgZcTLPWuUK
 Rm8UfeIh/XLSKZ3EnL14U94bOqdyCxTW+gOvkog9uUWAjERHMY1HiTVJkWwUy1ZTWxjN
 xcuA==
X-Gm-Message-State: AGi0PubdCtgreBDXgr0MueYTdYuRL4bQA/MZn6Ha6na+rGZphcaNaioI
 sWmHIz2UV0UAa4nzzeKqiEWiiForb68U4yxiICj3JHPp+YdFCdZV7c2wR89OuiXUPYmGtv4/5x9
 kCh5pgZ+ifldsROGqmuxkDQw/4RTPCLc+SuXBuRCNeQ==
X-Received: by 2002:a37:a7cd:: with SMTP id q196mr2960682qke.447.1585831039544; 
 Thu, 02 Apr 2020 05:37:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ0I00cVKswz3vNdf6Dr0WhRrTlZgEbT2Br3s+aMGt4SrYp5fv90+mvLN93pvzAK4++FO8L4w==
X-Received: by 2002:a37:a7cd:: with SMTP id q196mr2960665qke.447.1585831039221; 
 Thu, 02 Apr 2020 05:37:19 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id 68sm3343978qkh.75.2020.04.02.05.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 05:37:17 -0700 (PDT)
Date: Thu, 2 Apr 2020 08:37:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: teawater <teawaterz@linux.alibaba.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200402083630-mutt-send-email-mst@kernel.org>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <20200331093300-mutt-send-email-mst@kernel.org>
 <b69796e0-fa41-a219-c3e5-a11e9f5f18bf@redhat.com>
 <20200331100359-mutt-send-email-mst@kernel.org>
 <02745FD3-E30D-453B-8664-94B8EBF3B313@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <02745FD3-E30D-453B-8664-94B8EBF3B313@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>, Hui Zhu <teawater@gmail.com>
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

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMDQ6MDA6MDVQTSArMDgwMCwgdGVhd2F0ZXIgd3JvdGU6
Cj4gCj4gCj4gPiAyMDIw5bm0M+aciDMx5pelIDIyOjA377yMTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT4g5YaZ6YGT77yaCj4gPiAKPiA+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0
IDA0OjAzOjE4UE0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+IE9uIDMxLjAz
LjIwIDE1OjM3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPj4+IE9uIFR1ZSwgTWFyIDMx
LCAyMDIwIGF0IDAzOjMyOjA1UE0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+
Pj4gT24gMzEuMDMuMjAgMTU6MjQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4+PiBP
biBUdWUsIE1hciAzMSwgMjAyMCBhdCAxMjozNToyNFBNICswMjAwLCBEYXZpZCBIaWxkZW5icmFu
ZCB3cm90ZToKPiA+Pj4+Pj4gT24gMjYuMDMuMjAgMTA6NDksIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPiA+Pj4+Pj4+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA4OjU0OjA0QU0gKzAxMDAs
IERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+IAo+ID4+Pj4+
Pj4+PiBBbSAyNi4wMy4yMDIwIHVtIDA4OjIxIHNjaHJpZWIgTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT46Cj4gPj4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+PiDvu79PbiBUaHUsIE1hciAx
MiwgMjAyMCBhdCAwOTo1MToyNUFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+
Pj4+Pj4+Pj4+PiBPbiAxMi4wMy4yMCAwOTo0NywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+
ID4+Pj4+Pj4+Pj4+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDA5OjM3OjMyQU0gKzAxMDAsIERh
dmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4+Pj4+Pj4+PiAyLiBZb3UgYXJlIGVzc2VudGlh
bGx5IHN0ZWFsaW5nIFRIUHMgaW4gdGhlIGd1ZXN0LiBTbyB0aGUgZmFzdGVzdAo+ID4+Pj4+Pj4+
Pj4+PiBtYXBwaW5nIChUSFAgaW4gZ3Vlc3QgYW5kIGhvc3QpIGlzIGdvbmUuIFRoZSBndWVzdCB3
b24ndCBiZSBhYmxlIHRvIG1ha2UKPiA+Pj4+Pj4+Pj4+Pj4gdXNlIG9mIFRIUCB3aGVyZSBpdCBw
cmV2aW91c2x5IHdhcyBhYmxlIHRvLiBJIGNhbiBpbWFnaW5lIHRoaXMgaW1wbGllcyBhCj4gPj4+
Pj4+Pj4+Pj4+IHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIGZvciBzb21lIHdvcmtsb2Fkcy4gVGhp
cyBuZWVkcyBhIHByb3Blcgo+ID4+Pj4+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBldmFsdWF0aW9uLgo+
ID4+Pj4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+Pj4+IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgbW9yZSB3
aXRoIHRoZSBhbGxvY19wYWdlcyBBUEkuCj4gPj4+Pj4+Pj4+Pj4gVGhhdCBnaXZlcyB5b3UgZXhh
Y3RseSB0aGUgZ2l2ZW4gb3JkZXIsIGFuZCBpZiB0aGVyZSdzCj4gPj4+Pj4+Pj4+Pj4gYSBsYXJn
ZXIgY2h1bmsgYXZhaWxhYmxlLCBpdCB3aWxsIHNwbGl0IGl0IHVwLgo+ID4+Pj4+Pj4+Pj4+IAo+
ID4+Pj4+Pj4+Pj4+IEJ1dCBmb3IgYmFsbG9vbiAtIEkgc3VzcGVjdCBsb3RzIG9mIG90aGVyIHVz
ZXJzLAo+ID4+Pj4+Pj4+Pj4+IHdlIGRvIG5vdCB3YW50IHRvIHN0cmVzcyB0aGUgc3lzdGVtIGJ1
dCBpZiBhIGxhcmdlCj4gPj4+Pj4+Pj4+Pj4gY2h1bmsgaXMgYXZhaWxhYmxlIGFueXdheSwgdGhl
biB3ZSBjb3VsZCBoYW5kbGUKPiA+Pj4+Pj4+Pj4+PiB0aGF0IG1vcmUgb3B0aW1hbGx5IGJ5IGdl
dHRpbmcgaXQgYWxsIGluIG9uZSBnby4KPiA+Pj4+Pj4+Pj4+PiAKPiA+Pj4+Pj4+Pj4+PiAKPiA+
Pj4+Pj4+Pj4+PiBTbyBpZiB3ZSB3YW50IHRvIGFkZHJlc3MgdGhpcywgSU1ITyB0aGlzIGNhbGxz
IGZvciBhIG5ldyBBUEkuCj4gPj4+Pj4+Pj4+Pj4gQWxvbmcgdGhlIGxpbmVzIG9mCj4gPj4+Pj4+
Pj4+Pj4gCj4gPj4+Pj4+Pj4+Pj4gc3RydWN0IHBhZ2UgKmFsbG9jX3BhZ2VfcmFuZ2UoZ2ZwX3Qg
Z2ZwLCB1bnNpZ25lZCBpbnQgbWluX29yZGVyLAo+ID4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgbWF4X29yZGVyLCB1bnNpZ25lZCBpbnQgKm9yZGVyKQo+ID4+Pj4+Pj4+
Pj4+IAo+ID4+Pj4+Pj4+Pj4+IHRoZSBpZGVhIHdvdWxkIHRoZW4gYmUgdG8gcmV0dXJuIGF0IGEg
bnVtYmVyIG9mIHBhZ2VzIGluIHRoZSBnaXZlbgo+ID4+Pj4+Pj4+Pj4+IHJhbmdlLgo+ID4+Pj4+
Pj4+Pj4+IAo+ID4+Pj4+Pj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rPyBXYW50IHRvIHRyeSBpbXBs
ZW1lbnRpbmcgdGhhdD8KPiA+Pj4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+Pj4gWW91IGNhbiBqdXN0IHN0
YXJ0IHdpdGggdGhlIGhpZ2hlc3Qgb3JkZXIgYW5kIGRlY3JlbWVudCB0aGUgb3JkZXIgdW50aWwK
PiA+Pj4+Pj4+Pj4+IHlvdXIgYWxsb2NhdGlvbiBzdWNjZWVkcyB1c2luZyBhbGxvY19wYWdlcygp
LCB3aGljaCB3b3VsZCBiZSBlbm91Z2ggZm9yCj4gPj4+Pj4+Pj4+PiBhIGZpcnN0IHZlcnNpb24u
IEF0IGxlYXN0IEkgZG9uJ3Qgc2VlIHRoZSBpbW1lZGlhdGUgbmVlZCBmb3IgYSBuZXcKPiA+Pj4+
Pj4+Pj4+IGtlcm5lbCBBUEkuCj4gPj4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+PiBPSyBJIHJlbWVtYmVy
IG5vdy4gIFRoZSBwcm9ibGVtIGlzIHdpdGggcmVjbGFpbS4gVW5sZXNzIHJlY2xhaW0gaXMKPiA+
Pj4+Pj4+Pj4gY29tcGxldGVseSBkaXNhYmxlZCwgYW55IG9mIHRoZXNlIGNhbGxzIGNhbiBzbGVl
cC4gQWZ0ZXIgaXQgd2FrZXMgdXAsCj4gPj4+Pj4+Pj4+IHdlIHdvdWxkIGxpa2UgdG8gZ2V0IHRo
ZSBsYXJnZXIgb3JkZXIgdGhhdCBoYXMgYmVjb21lIGF2YWlsYWJsZQo+ID4+Pj4+Pj4+PiBtZWFu
d2hpbGUuCj4gPj4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+IAo+ID4+Pj4+Pj4+IFllcywgYnV0IHRoYXTi
gJhzIGEgcHVyZSBvcHRpbWl6YXRpb24gSU1ITy4KPiA+Pj4+Pj4+PiBTbyBJIHRoaW5rIHdlIHNo
b3VsZCBkbyBhIHRyaXZpYWwgaW1wbGVtZW50YXRpb24gZmlyc3QgYW5kIHRoZW4gc2VlIHdoYXQg
d2UgZ2FpbiBmcm9tIGEgbmV3IGFsbG9jYXRvciBBUEkuIFRoZW4gd2UgbWlnaHQgYWxzbyBiZSBh
YmxlIHRvIGp1c3RpZnkgaXQgdXNpbmcgcmVhbCBudW1iZXJzLgo+ID4+Pj4+Pj4+IAo+ID4+Pj4+
Pj4gCj4gPj4+Pj4+PiBXZWxsIGhvdyBkbyB5b3UgcHJvcG9zZSBpbXBsZW1lbnQgdGhlIG5lY2Vz
c2FyeSBzZW1hbnRpY3M/Cj4gPj4+Pj4+PiBJIHRoaW5rIHdlIGFyZSBib3RoIGFncmVlZCB0aGF0
IGFsbG9jX3BhZ2VfcmFuZ2UgaXMgbW9yZSBvcgo+ID4+Pj4+Pj4gbGVzcyB3aGF0J3MgbmVjZXNz
YXJ5IGFueXdheSAtIHNvIGhvdyB3b3VsZCB5b3UgYXBwcm94aW1hdGUgaXQKPiA+Pj4+Pj4+IG9u
IHRvcCBvZiBleGlzdGluZyBBUElzPwo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9iYWxsb29uX2NvbXBhY3Rpb24uaCBiL2luY2x1ZGUvbGludXgvYmFsbG9vbl9jb21wYWN0aW9u
LmgKPiA+Pj4gCj4gPj4+IC4uLi4uCj4gPj4+IAo+ID4+PiAKPiA+Pj4+Pj4gZGlmZiAtLWdpdCBh
L21tL2JhbGxvb25fY29tcGFjdGlvbi5jIGIvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPiA+Pj4+
Pj4gaW5kZXggMjZkZTAyMGFhZTdiLi4wNjc4MTBiMzI4MTMgMTAwNjQ0Cj4gPj4+Pj4+IC0tLSBh
L21tL2JhbGxvb25fY29tcGFjdGlvbi5jCj4gPj4+Pj4+ICsrKyBiL21tL2JhbGxvb25fY29tcGFj
dGlvbi5jCj4gPj4+Pj4+IEBAIC0xMTIsMjMgKzExMiwzNSBAQCBzaXplX3QgYmFsbG9vbl9wYWdl
X2xpc3RfZGVxdWV1ZShzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyAqYl9kZXZfaW5mbywKPiA+Pj4+
Pj4gRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlX2xpc3RfZGVxdWV1ZSk7Cj4gPj4+Pj4+
IAo+ID4+Pj4+PiAvKgo+ID4+Pj4+PiAtICogYmFsbG9vbl9wYWdlX2FsbG9jIC0gYWxsb2NhdGVz
IGEgbmV3IHBhZ2UgZm9yIGluc2VydGlvbiBpbnRvIHRoZSBiYWxsb29uCj4gPj4+Pj4+IC0gKgkJ
CXBhZ2UgbGlzdC4KPiA+Pj4+Pj4gKyAqIGJhbGxvb25fcGFnZXNfYWxsb2MgLSBhbGxvY2F0ZXMg
YSBuZXcgcGFnZSAob2YgYXQgbW9zdCB0aGUgZ2l2ZW4gb3JkZXIpCj4gPj4+Pj4+ICsgKiAJCQkg
Zm9yIGluc2VydGlvbiBpbnRvIHRoZSBiYWxsb29uIHBhZ2UgbGlzdC4KPiA+Pj4+Pj4gKgo+ID4+
Pj4+PiAqIERyaXZlciBtdXN0IGNhbGwgdGhpcyBmdW5jdGlvbiB0byBwcm9wZXJseSBhbGxvY2F0
ZSBhIG5ldyBiYWxsb29uIHBhZ2UuCj4gPj4+Pj4+ICogRHJpdmVyIG11c3QgY2FsbCBiYWxsb29u
X3BhZ2VfZW5xdWV1ZSBiZWZvcmUgZGVmaW5pdGl2ZWx5IHJlbW92aW5nIHRoZSBwYWdlCj4gPj4+
Pj4+ICogZnJvbSB0aGUgZ3Vlc3Qgc3lzdGVtLgo+ID4+Pj4+PiAqCj4gPj4+Pj4+ICsgKiBXaWxs
IGZhbGwgYmFjayB0byBzbWFsbGVyIG9yZGVycyBpZiBhbGxvY2F0aW9uIGZhaWxzLiBUaGUgb3Jk
ZXIgb2YgdGhlCj4gPj4+Pj4+ICsgKiBhbGxvY2F0ZWQgcGFnZSBpcyBzdG9yZWQgaW4gcGFnZS0+
cHJpdmF0ZS4KPiA+Pj4+Pj4gKyAqCj4gPj4+Pj4+ICogUmV0dXJuOiBzdHJ1Y3QgcGFnZSBmb3Ig
dGhlIGFsbG9jYXRlZCBwYWdlIG9yIE5VTEwgb24gYWxsb2NhdGlvbiBmYWlsdXJlLgo+ID4+Pj4+
PiAqLwo+ID4+Pj4+PiAtc3RydWN0IHBhZ2UgKmJhbGxvb25fcGFnZV9hbGxvYyh2b2lkKQo+ID4+
Pj4+PiArc3RydWN0IHBhZ2UgKmJhbGxvb25fcGFnZXNfYWxsb2MoaW50IG9yZGVyKQo+ID4+Pj4+
PiB7Cj4gPj4+Pj4+IC0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSBhbGxvY19wYWdlKGJhbGxvb25fbWFw
cGluZ19nZnBfbWFzaygpIHwKPiA+Pj4+Pj4gLQkJCQkgICAgICAgX19HRlBfTk9NRU1BTExPQyB8
IF9fR0ZQX05PUkVUUlkgfAo+ID4+Pj4+PiAtCQkJCSAgICAgICBfX0dGUF9OT1dBUk4pOwo+ID4+
Pj4+PiAtCXJldHVybiBwYWdlOwo+ID4+Pj4+PiArCXN0cnVjdCBwYWdlICpwYWdlOwo+ID4+Pj4+
PiArCj4gPj4+Pj4+ICsJd2hpbGUgKG9yZGVyID49IDApIHsKPiA+Pj4+Pj4gKwkJcGFnZSA9IGFs
bG9jX3BhZ2VzKGJhbGxvb25fbWFwcGluZ19nZnBfbWFzaygpIHwKPiA+Pj4+Pj4gKwkJCQkgICBf
X0dGUF9OT01FTUFMTE9DIHwgX19HRlBfTk9SRVRSWSB8Cj4gPj4+Pj4+ICsJCQkJICAgX19HRlBf
Tk9XQVJOLCBvcmRlcik7Cj4gPj4+Pj4+ICsJCWlmIChwYWdlKSB7Cj4gPj4+Pj4+ICsJCQlzZXRf
cGFnZV9wcml2YXRlKHBhZ2UsIG9yZGVyKTsKPiA+Pj4+Pj4gKwkJCXJldHVybiBwYWdlOwo+ID4+
Pj4+PiArCQl9Cj4gPj4+Pj4+ICsJCW9yZGVyLS07Cj4gPj4+Pj4+ICsJfQo+ID4+Pj4+PiArCXJl
dHVybiBOVUxMOwo+ID4+Pj4+PiB9Cj4gPj4+Pj4+IC1FWFBPUlRfU1lNQk9MX0dQTChiYWxsb29u
X3BhZ2VfYWxsb2MpOwo+ID4+Pj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlc19h
bGxvYyk7Cj4gPj4+Pj4+IAo+ID4+Pj4+PiAvKgo+ID4+Pj4+PiAqIGJhbGxvb25fcGFnZV9lbnF1
ZXVlIC0gaW5zZXJ0cyBhIG5ldyBwYWdlIGludG8gdGhlIGJhbGxvb24gcGFnZSBsaXN0Lgo+ID4+
Pj4+IAo+ID4+Pj4+IAo+ID4+Pj4+IEkgdGhpbmsgdGhpcyB3aWxsIHRyeSB0byBpbnZva2UgZGly
ZWN0IHJlY2xhaW0gZnJvbSB0aGUgZmlyc3QgaXRlcmF0aW9uCj4gPj4+Pj4gdG8gZnJlZSB1cCB0
aGUgbWF4IG9yZGVyLgo+ID4+Pj4gCj4gPj4+PiAlX19HRlBfTk9SRVRSWTogVGhlIFZNIGltcGxl
bWVudGF0aW9uIHdpbGwgdHJ5IG9ubHkgdmVyeSBsaWdodHdlaWdodAo+ID4+Pj4gbWVtb3J5IGRp
cmVjdCByZWNsYWltIHRvIGdldCBzb21lIG1lbW9yeSB1bmRlciBtZW1vcnkgcHJlc3N1cmUgKHRo
dXMgaXQKPiA+Pj4+IGNhbiBzbGVlcCkuIEl0IHdpbGwgYXZvaWQgZGlzcnVwdGl2ZSBhY3Rpb25z
IGxpa2UgT09NIGtpbGxlci4KPiA+Pj4+IAo+ID4+Pj4gQ2VydGFpbmx5IGdvb2QgZW5vdWdoIGZv
ciBhIGZpcnN0IHZlcnNpb24gSSB3b3VsZCBzYXksIG5vPwo+ID4+PiAKPiA+Pj4gRnJhbmtseSBo
b3cgd2VsbCB0aGF0IGJlaGF2ZXMgd291bGQgZGVwZW5kIGEgbG90IG9uIHRoZSB3b3JrbG9hZC4K
PiA+Pj4gQ2FuIHJlZ3Jlc3MganVzdCBhcyB3ZWxsLgo+ID4+PiAKPiA+Pj4gRm9yIHRoZSAxc3Qg
dmVyc2lvbiBJJ2QgcHJlZmVyIHNvbWV0aGluZyB0aGF0IGlzIHRoZSBsZWFzdCBkaXNydXB0aXZl
LAo+ID4+PiBhbmQgdGhhdCBJTUhPIG1lYW5zIHdlIG9ubHkgdHJpZ2dlciByZWNsYWltIGF0IGFs
bCBpbiB0aGUgc2FtZSBjb25maWd1cmF0aW9uCj4gPj4+IGFzIG5vdyAtIHdoZW4gd2UgY2FuJ3Qg
c2F0aXNmeSB0aGUgbG93ZXN0IG9yZGVyIGFsbG9jYXRpb24uCj4gPj4gCj4gPj4gQWdyZWVkLgo+
ID4+IAo+ID4+PiAKPiA+Pj4gQW55dGhpbmcgZWxzZSB3b3VsZCBiZSBhIGh1Z2UgYW1vdW50IG9m
IHRlc3Rpbmcgd2l0aCBhbGwga2luZCBvZgo+ID4+PiB3b3JrbG9hZHMuCj4gPj4+IAo+ID4+IAo+
ID4+IFNvIGRvaW5nIGEgIiYgfl9fR0ZQX1JFQ0xBSU0iIGluIGNhc2Ugb3JkZXIgPiAwPyAoYXMg
ZG9uZSBpbgo+ID4+IEdGUF9UUkFOU0hVR0VfTElHSFQpCj4gPiAKPiA+IFRoYXQgd2lsbCBpbXBy
b3ZlIHRoZSBzaXR1YXRpb24gd2hlbiByZWNsYWltIGlzIG5vdCBuZWVkZWQsIGJ1dCBsZWF2ZQo+
ID4gdGhlIHByb2JsZW0gaW4gcGxhY2UgZm9yIHdoZW4gaXQncyBuZWVkZWQ6IGlmIHJlY2xhaW0g
ZG9lcyB0cmlnZ2VyLCB3ZQo+ID4gY2FuIGdldCBhIGh1Z2UgZnJlZSBwYWdlIGFuZCBpbW1lZGlh
dGVseSBicmVhayBpdCB1cC4KPiA+IAo+ID4gU28gaXQncyBvayBhcyBhIGZpcnN0IHN0ZXAgYnV0
IGl0IHdpbGwgbWFrZSB0aGUgc2Vjb25kIHN0ZXAgaGFyZGVyIGFzCj4gPiB3ZSdsbCBuZWVkIHRv
IHRlc3Qgd2l0aCByZWNsYWltIDopLgo+IAo+IAo+IEkgd29ycnkgdGhhdCB3aWxsIGluY3JlYXNl
cyB0aGUgYWxsb2NhdGlvbiBmYWlsdXJlIHJhdGUgZm9yIGxhcmdlIHBhZ2VzLgo+IAo+IEkgdHJp
ZWQgYWxsb2MgMk0gbWVtb3J5IHdpdGhvdXQgX19HRlBfUkVDTEFJTSB3aGVuIEkgd3JvdGUgdGhl
IFZJUlRJT19CQUxMT09OX0ZfVEhQX09SREVSIGZpcnN0IHZlcnNpb24uCj4gSXQgd2lsbCBmYWls
IHdoZW4gSSB1c2UgdXNlbWVtIHB1bmNoLWhvbGVzIGZ1bmN0aW9uIGdlbmVyYXRlcyA0MDBtIGZy
YWdtZW50YXRpb24gcGFnZXMgaW4gdGhlIGd1ZXN0IGtlcm5lbC4KPiAKPiBXaGF0IGFib3V0IGFk
ZCBhbm90aGVyIG9wdGlvbiB0byBiYWxsb29uIHRvIGNvbnRyb2wgd2l0aCBfX0dGUF9SRUNMQUlN
IG9yIHdpdGhvdXQgaXQ/Cj4gCj4gQmVzdCwKPiBIdWkKClRoYXQgaXMgd2h5IEkgc3VnZ2VzdGVk
IGEgbmV3IEFQSSBzbyB3ZSBkbyBub3QgZnJhZ21lbnQgbWVtb3J5LgoKPiA+IAo+ID4gCj4gPj4g
LS0gCj4gPj4gVGhhbmtzLAo+ID4+IAo+ID4+IERhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
