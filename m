Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F319975F
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 15:24:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A98C88754;
	Tue, 31 Mar 2020 13:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcyKDUUH8tHK; Tue, 31 Mar 2020 13:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56F0D88721;
	Tue, 31 Mar 2020 13:24:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AB36C07FF;
	Tue, 31 Mar 2020 13:24:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94DD3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8053E8777D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1rtFOH6+O2y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCB4B87767
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585661085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jw0nVbBv0FETBp7dw512h5tWtdfOySkR2Wz/CAg+zzM=;
 b=L3fVFdjdxtuPCUhufRZaKE1XVuFH9HA66LxemcfE/mo0hecuYzKZ/GfuC2fnD3B90B93Fz
 wOAo9wEhm6b07rarfrAP3iLkppZFaaU6k/kYNIaFP2DFgpfaQQ/+9ppRUtOJX9Rg5oam8L
 ouXbrH0cTkSk8/uU7prYdvPKq62NXKQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-0cKHkZSGP9y7HSZ-VZ5pYQ-1; Tue, 31 Mar 2020 09:24:43 -0400
X-MC-Unique: 0cKHkZSGP9y7HSZ-VZ5pYQ-1
Received: by mail-wm1-f69.google.com with SMTP id m4so721646wme.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Jw0nVbBv0FETBp7dw512h5tWtdfOySkR2Wz/CAg+zzM=;
 b=TXyct5T7k9SVl45ZMzWHMJ1EgJWv2t8Odtppq0etsUKHO1YixZ5FmJR5JcSnJw4gWX
 uT6XWHXfniij6YaW3ARV0KdlvSMZA/C8QpNavjMUYgYOVm/PPJS+/GqDP//t4VRPVkoG
 pLbhXzonUEH5RI6fmtuZJmShW5qzcZwWCoT+/PmErE1YPQz8ahcM60eivKZlzrbupZD0
 JOhs+3kFiQ1cYrCfpl570a+keBapi/mFikq/cnNSqfWQp/qxo/i/UCD7L66V/R2ucQVz
 teQVg9PHuXs/qh/oBTYTSsCmQcZ2BFMk6bgN2Xx6sFlClGdFJtygtk5KUa/X2/jVho0u
 5blg==
X-Gm-Message-State: ANhLgQ0wWaiN58ISUY5KF7Pp4sm8ynVn8OHaZooBXArUuVMELDQyYWhC
 AfPtAFTPt4fBEsJQ85uNb7xTVPXFsTmxyqn64qx+hHrUZfBbRP2wffPQNZOPniaWaAYXqwVkfks
 UFmzearFZ/8avZGBFXpb3PaC9qOSaBLKszw1X/JA1ww==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr3403589wmj.2.1585661082434;
 Tue, 31 Mar 2020 06:24:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vueGTo4Ef5rfIWPa4rYbmXOXg2dHEafCnE+5sFNPgsm8xhuhqsFd64QYZSAHkmDonQf6kjs/g==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr3403562wmj.2.1585661082107;
 Tue, 31 Mar 2020 06:24:42 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id b199sm4202969wme.23.2020.03.31.06.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 06:24:40 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:24:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200331091718-mutt-send-email-mst@kernel.org>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
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

T24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMTI6MzU6MjRQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMjYuMDMuMjAgMTA6NDksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
PiA+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA4OjU0OjA0QU0gKzAxMDAsIERhdmlkIEhpbGRl
bmJyYW5kIHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pj4gQW0gMjYuMDMuMjAyMCB1bSAwODoyMSBzY2hy
aWViIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ogo+ID4+Pgo+ID4+PiDvu79P
biBUaHUsIE1hciAxMiwgMjAyMCBhdCAwOTo1MToyNUFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFu
ZCB3cm90ZToKPiA+Pj4+PiBPbiAxMi4wMy4yMCAwOTo0NywgTWljaGFlbCBTLiBUc2lya2luIHdy
b3RlOgo+ID4+Pj4+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDA5OjM3OjMyQU0gKzAxMDAsIERh
dmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4+PiAyLiBZb3UgYXJlIGVzc2VudGlhbGx5IHN0
ZWFsaW5nIFRIUHMgaW4gdGhlIGd1ZXN0LiBTbyB0aGUgZmFzdGVzdAo+ID4+Pj4+PiBtYXBwaW5n
IChUSFAgaW4gZ3Vlc3QgYW5kIGhvc3QpIGlzIGdvbmUuIFRoZSBndWVzdCB3b24ndCBiZSBhYmxl
IHRvIG1ha2UKPiA+Pj4+Pj4gdXNlIG9mIFRIUCB3aGVyZSBpdCBwcmV2aW91c2x5IHdhcyBhYmxl
IHRvLiBJIGNhbiBpbWFnaW5lIHRoaXMgaW1wbGllcyBhCj4gPj4+Pj4+IHBlcmZvcm1hbmNlIGRl
Z3JhZGF0aW9uIGZvciBzb21lIHdvcmtsb2Fkcy4gVGhpcyBuZWVkcyBhIHByb3Blcgo+ID4+Pj4+
PiBwZXJmb3JtYW5jZSBldmFsdWF0aW9uLgo+ID4+Pj4+Cj4gPj4+Pj4gSSB0aGluayB0aGUgcHJv
YmxlbSBpcyBtb3JlIHdpdGggdGhlIGFsbG9jX3BhZ2VzIEFQSS4KPiA+Pj4+PiBUaGF0IGdpdmVz
IHlvdSBleGFjdGx5IHRoZSBnaXZlbiBvcmRlciwgYW5kIGlmIHRoZXJlJ3MKPiA+Pj4+PiBhIGxh
cmdlciBjaHVuayBhdmFpbGFibGUsIGl0IHdpbGwgc3BsaXQgaXQgdXAuCj4gPj4+Pj4KPiA+Pj4+
PiBCdXQgZm9yIGJhbGxvb24gLSBJIHN1c3BlY3QgbG90cyBvZiBvdGhlciB1c2VycywKPiA+Pj4+
PiB3ZSBkbyBub3Qgd2FudCB0byBzdHJlc3MgdGhlIHN5c3RlbSBidXQgaWYgYSBsYXJnZQo+ID4+
Pj4+IGNodW5rIGlzIGF2YWlsYWJsZSBhbnl3YXksIHRoZW4gd2UgY291bGQgaGFuZGxlCj4gPj4+
Pj4gdGhhdCBtb3JlIG9wdGltYWxseSBieSBnZXR0aW5nIGl0IGFsbCBpbiBvbmUgZ28uCj4gPj4+
Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFNvIGlmIHdlIHdhbnQgdG8gYWRkcmVzcyB0aGlzLCBJTUhPIHRo
aXMgY2FsbHMgZm9yIGEgbmV3IEFQSS4KPiA+Pj4+PiBBbG9uZyB0aGUgbGluZXMgb2YKPiA+Pj4+
Pgo+ID4+Pj4+ICAgIHN0cnVjdCBwYWdlICphbGxvY19wYWdlX3JhbmdlKGdmcF90IGdmcCwgdW5z
aWduZWQgaW50IG1pbl9vcmRlciwKPiA+Pj4+PiAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IG1heF9vcmRlciwgdW5zaWduZWQgaW50ICpvcmRlcikKPiA+Pj4+Pgo+ID4+Pj4+IHRoZSBp
ZGVhIHdvdWxkIHRoZW4gYmUgdG8gcmV0dXJuIGF0IGEgbnVtYmVyIG9mIHBhZ2VzIGluIHRoZSBn
aXZlbgo+ID4+Pj4+IHJhbmdlLgo+ID4+Pj4+Cj4gPj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/IFdh
bnQgdG8gdHJ5IGltcGxlbWVudGluZyB0aGF0Pwo+ID4+Pj4KPiA+Pj4+IFlvdSBjYW4ganVzdCBz
dGFydCB3aXRoIHRoZSBoaWdoZXN0IG9yZGVyIGFuZCBkZWNyZW1lbnQgdGhlIG9yZGVyIHVudGls
Cj4gPj4+PiB5b3VyIGFsbG9jYXRpb24gc3VjY2VlZHMgdXNpbmcgYWxsb2NfcGFnZXMoKSwgd2hp
Y2ggd291bGQgYmUgZW5vdWdoIGZvcgo+ID4+Pj4gYSBmaXJzdCB2ZXJzaW9uLiBBdCBsZWFzdCBJ
IGRvbid0IHNlZSB0aGUgaW1tZWRpYXRlIG5lZWQgZm9yIGEgbmV3Cj4gPj4+PiBrZXJuZWwgQVBJ
Lgo+ID4+Pgo+ID4+PiBPSyBJIHJlbWVtYmVyIG5vdy4gIFRoZSBwcm9ibGVtIGlzIHdpdGggcmVj
bGFpbS4gVW5sZXNzIHJlY2xhaW0gaXMKPiA+Pj4gY29tcGxldGVseSBkaXNhYmxlZCwgYW55IG9m
IHRoZXNlIGNhbGxzIGNhbiBzbGVlcC4gQWZ0ZXIgaXQgd2FrZXMgdXAsCj4gPj4+IHdlIHdvdWxk
IGxpa2UgdG8gZ2V0IHRoZSBsYXJnZXIgb3JkZXIgdGhhdCBoYXMgYmVjb21lIGF2YWlsYWJsZQo+
ID4+PiBtZWFud2hpbGUuCj4gPj4+Cj4gPj4KPiA+PiBZZXMsIGJ1dCB0aGF04oCYcyBhIHB1cmUg
b3B0aW1pemF0aW9uIElNSE8uCj4gPj4gU28gSSB0aGluayB3ZSBzaG91bGQgZG8gYSB0cml2aWFs
IGltcGxlbWVudGF0aW9uIGZpcnN0IGFuZCB0aGVuIHNlZSB3aGF0IHdlIGdhaW4gZnJvbSBhIG5l
dyBhbGxvY2F0b3IgQVBJLiBUaGVuIHdlIG1pZ2h0IGFsc28gYmUgYWJsZSB0byBqdXN0aWZ5IGl0
IHVzaW5nIHJlYWwgbnVtYmVycy4KPiA+Pgo+ID4gCj4gPiBXZWxsIGhvdyBkbyB5b3UgcHJvcG9z
ZSBpbXBsZW1lbnQgdGhlIG5lY2Vzc2FyeSBzZW1hbnRpY3M/Cj4gPiBJIHRoaW5rIHdlIGFyZSBi
b3RoIGFncmVlZCB0aGF0IGFsbG9jX3BhZ2VfcmFuZ2UgaXMgbW9yZSBvcgo+ID4gbGVzcyB3aGF0
J3MgbmVjZXNzYXJ5IGFueXdheSAtIHNvIGhvdyB3b3VsZCB5b3UgYXBwcm94aW1hdGUgaXQKPiA+
IG9uIHRvcCBvZiBleGlzdGluZyBBUElzPwo+IAo+IExvb2tpbmcgYXQgZHJpdmVycy9taXNjL3Zt
d19iYWxsb29uLmM6dm1iYWxsb29uX2luZmxhdGUoKSwgaXQgZmlyc3QKPiB0cmllcyB0byBhbGxv
Y2F0ZSBodWdlIHBhZ2VzIHVzaW5nCj4gCj4gCWFsbG9jX3BhZ2VzKF9fR0ZQX0hJR0hNRU18X19H
RlBfTk9XQVJOfCBfX0dGUF9OT01FTUFMTE9DLCAKPiAgICAgICAgICAgICAgICAgICAgIFZNV19C
QUxMT09OXzJNX09SREVSKQo+IAo+IEFuZCB0aGVuIGZhbGxzIGJhY2sgdG8gNGsgYWxsb2NhdGlv
bnMgKGJhbGxvb25fcGFnZV9hbGxvYygpKSBpbiBjYXNlCj4gYWxsb2NhdGlvbiBmYWlscy4KPiAK
PiBJJ20gcm91Z2hseSB0aGlua2luZyBvZiBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nLCBi
dXQgd2l0aCBhbgo+IG9wdGltaXplZCByZXBvcnRpbmcgaW50ZXJmYWNlL2JpZ2dlciBwZm4gYXJy
YXkgc28gd2UgY2FuIHJlcG9ydCA+Cj4gMU1CIGF0IGEgdGltZS4gQWxzbywgaXQgbWlnaHQgbWFr
ZSBzZW5zZSB0byByZW1lbWJlciB0aGUgb3JkZXIgdGhhdAo+IHN1Y2NlZWRlZCBhY3Jvc3Mgc29t
ZSBmaWxsX2JhbGxvb24oKSBjYWxscy4KPiAKPiBEb24ndCBldmVuIGV4cGVjdCBpdCB0byBjb21w
aWxlIC4uLgo+IAo+IAo+IAo+ID5Gcm9tIDQzMDVmOTg5NjcyY2NjYTRiZTkyOTNlNmQ0MTY3ZTky
OWYzZTI5OWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogRGF2aWQgSGlsZGVuYnJh
bmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4gRGF0ZTogVHVlLCAzMSBNYXIgMjAyMCAxMjoyODowNyAr
MDIwMAo+IFN1YmplY3Q6IFtQQVRDSCBSRkNdIHRtcAo+IAo+IFNpZ25lZC1vZmYtYnk6IERhdmlk
IEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpcnRpby92
aXJ0aW9fYmFsbG9vbi5jICAgIHwgMzggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgaW5j
bHVkZS9saW51eC9iYWxsb29uX2NvbXBhY3Rpb24uaCB8ICA3ICsrKystCj4gIG1tL2JhbGxvb25f
Y29tcGFjdGlvbi5jICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYyBiL2RyaXZl
cnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMKPiBpbmRleCA4NTExZDI1OGRiYjQuLjA2NjBiMWI5
ODhmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4gKysr
IGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+IEBAIC0xODcsNyArMTg3LDcgQEAg
aW50IHZpcnRiYWxsb29uX2ZyZWVfcGFnZV9yZXBvcnQoc3RydWN0IHBhZ2VfcmVwb3J0aW5nX2Rl
dl9pbmZvICpwcl9kZXZfaW5mbywKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgc2V0X3BhZ2VfcGZu
cyhzdHJ1Y3QgdmlydGlvX2JhbGxvb24gKnZiLAo+IC0JCQkgIF9fdmlydGlvMzIgcGZuc1tdLCBz
dHJ1Y3QgcGFnZSAqcGFnZSkKPiArCQkJICBfX3ZpcnRpbzMyIHBmbnNbXSwgc3RydWN0IHBhZ2Ug
KnBhZ2UsIGludCBvcmRlcikKPiAgewo+ICAJdW5zaWduZWQgaW50IGk7Cj4gIAo+IEBAIC0xOTcs
NyArMTk3LDcgQEAgc3RhdGljIHZvaWQgc2V0X3BhZ2VfcGZucyhzdHJ1Y3QgdmlydGlvX2JhbGxv
b24gKnZiLAo+ICAJICogU2V0IGJhbGxvb24gcGZucyBwb2ludGluZyBhdCB0aGlzIHBhZ2UuCj4g
IAkgKiBOb3RlIHRoYXQgdGhlIGZpcnN0IHBmbiBwb2ludHMgYXQgc3RhcnQgb2YgdGhlIHBhZ2Uu
Cj4gIAkgKi8KPiAtCWZvciAoaSA9IDA7IGkgPCBWSVJUSU9fQkFMTE9PTl9QQUdFU19QRVJfUEFH
RTsgaSsrKQo+ICsJZm9yIChpID0gMDsgaSA8IFZJUlRJT19CQUxMT09OX1BBR0VTX1BFUl9QQUdF
ICogKDEgPDwgb3JkZXIpOyBpKyspCj4gIAkJcGZuc1tpXSA9IGNwdV90b192aXJ0aW8zMih2Yi0+
dmRldiwKPiAgCQkJCQkgIHBhZ2VfdG9fYmFsbG9vbl9wZm4ocGFnZSkgKyBpKTsKPiAgfQo+IEBA
IC0yMDUsNiArMjA1LDcgQEAgc3RhdGljIHZvaWQgc2V0X3BhZ2VfcGZucyhzdHJ1Y3QgdmlydGlv
X2JhbGxvb24gKnZiLAo+ICBzdGF0aWMgdW5zaWduZWQgZmlsbF9iYWxsb29uKHN0cnVjdCB2aXJ0
aW9fYmFsbG9vbiAqdmIsIHNpemVfdCBudW0pCj4gIHsKPiAgCXVuc2lnbmVkIG51bV9hbGxvY2F0
ZWRfcGFnZXM7Cj4gKwlpbnQgb3JkZXIgPSBNQVhfT1JERVIgLSAxOwo+ICAJdW5zaWduZWQgbnVt
X3BmbnM7Cj4gIAlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAgCUxJU1RfSEVBRChwYWdlcyk7Cj4gQEAg
LTIxMiw5ICsyMTMsMjAgQEAgc3RhdGljIHVuc2lnbmVkIGZpbGxfYmFsbG9vbihzdHJ1Y3Qgdmly
dGlvX2JhbGxvb24gKnZiLCBzaXplX3QgbnVtKQo+ICAJLyogV2UgY2FuIG9ubHkgZG8gb25lIGFy
cmF5IHdvcnRoIGF0IGEgdGltZS4gKi8KPiAgCW51bSA9IG1pbihudW0sIEFSUkFZX1NJWkUodmIt
PnBmbnMpKTsKPiAgCj4gKwkvKgo+ICsJICogTm90ZTogd2Ugd2lsbCBjdXJyZW50bHkgbmV2ZXIg
YWxsb2NhdGUgbW9yZSB0aGFuIDFNQiBkdWUgdG8gdGhlCj4gKwkgKiBwZm4gYXJyYXkgc2l6ZSwg
c28gd2Ugd2lsbCBub3QgYWxsb2NhdGUgTUFYX09SREVSIC0gMSAuLi4KPiArCSAqLwo+ICsKPiAg
CWZvciAobnVtX3BmbnMgPSAwOyBudW1fcGZucyA8IG51bTsKPiAtCSAgICAgbnVtX3BmbnMgKz0g
VklSVElPX0JBTExPT05fUEFHRVNfUEVSX1BBR0UpIHsKPiAtCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9
IGJhbGxvb25fcGFnZV9hbGxvYygpOwo+ICsJICAgICBudW1fcGZucyArPSBWSVJUSU9fQkFMTE9P
Tl9QQUdFU19QRVJfUEFHRSAqICgxIDw8IG9yZGVyKSkgewo+ICsJCWNvbnN0IHVuc2lnbmVkIGxv
bmcgcmVtYWluaW5nID0gbnVtIC0gbnVtX3BmbnM7Cj4gKwo+ICsJCW9yZGVyID0gTUlOKG9yZGVy
LAo+ICsJCQkgICAgZ2V0X29yZGVyKHJlbWFpbmluZyA8PCBWSVJUSU9fQkFMTE9PTl9QRk5fU0hJ
RlQpKTsKPiArCQlpZiAoKDEgPDwgb3JkZXIpICogVklSVElPX0JBTExPT05fUEFHRVNfUEVSX1BB
R0UgPiByZW1haW5pbmcpCj4gKwkJCW9yZGVyLS07Cj4gKwkJcGFnZSA9IGJhbGxvb25fcGFnZXNf
YWxsb2Mob3JkZXIpOwo+ICAKPiAgCQlpZiAoIXBhZ2UpIHsKPiAgCQkJZGV2X2luZm9fcmF0ZWxp
bWl0ZWQoJnZiLT52ZGV2LT5kZXYsCj4gQEAgLTIyNSw2ICsyMzcsOCBAQCBzdGF0aWMgdW5zaWdu
ZWQgZmlsbF9iYWxsb29uKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIsIHNpemVfdCBudW0pCj4g
IAkJCWJyZWFrOwo+ICAJCX0KPiAgCj4gKwkJLyogQ29udGludWUgd2l0aCB0aGUgYWN0dWFsIG9y
ZGVyIHRoYXQgc3VjY2VlZGVkLiAqLwo+ICsJCW9yZGVyID0gcGFnZV9wcml2YXRlKHBhZ2UpOwo+
ICAJCWJhbGxvb25fcGFnZV9wdXNoKCZwYWdlcywgcGFnZSk7Cj4gIAl9Cj4gIAo+IEBAIC0yMzMs
MTQgKzI0NywxNiBAQCBzdGF0aWMgdW5zaWduZWQgZmlsbF9iYWxsb29uKHN0cnVjdCB2aXJ0aW9f
YmFsbG9vbiAqdmIsIHNpemVfdCBudW0pCj4gIAl2Yi0+bnVtX3BmbnMgPSAwOwo+ICAKPiAgCXdo
aWxlICgocGFnZSA9IGJhbGxvb25fcGFnZV9wb3AoJnBhZ2VzKSkpIHsKPiArCQlvcmRlciA9IHBh
Z2Vfb3JkZXIocGFnZSk7Cj4gKwkJLyogZW5xdWV1aW5nIHdpbGwgc3BsaXQgdGhlIHBhZ2UgYW5k
IGNsZWFyIHRoZSBvcmRlciAqLwo+ICAJCWJhbGxvb25fcGFnZV9lbnF1ZXVlKCZ2Yi0+dmJfZGV2
X2luZm8sIHBhZ2UpOwo+ICAKPiAtCQlzZXRfcGFnZV9wZm5zKHZiLCB2Yi0+cGZucyArIHZiLT5u
dW1fcGZucywgcGFnZSk7Cj4gLQkJdmItPm51bV9wYWdlcyArPSBWSVJUSU9fQkFMTE9PTl9QQUdF
U19QRVJfUEFHRTsKPiArCQlzZXRfcGFnZV9wZm5zKHZiLCB2Yi0+cGZucyArIHZiLT5udW1fcGZu
cywgcGFnZSwgb3JkZXIpOwo+ICsJCXZiLT5udW1fcGFnZXMgKz0gVklSVElPX0JBTExPT05fUEFH
RVNfUEVSX1BBR0UgKiAoMSA8PCBvcmRlcik7Cj4gIAkJaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUo
dmItPnZkZXYsCj4gIAkJCQkJVklSVElPX0JBTExPT05fRl9ERUZMQVRFX09OX09PTSkpCj4gLQkJ
CWFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQocGFnZSwgLTEpOwo+IC0JCXZiLT5udW1fcGZucyAr
PSBWSVJUSU9fQkFMTE9PTl9QQUdFU19QRVJfUEFHRTsKPiArCQkJYWRqdXN0X21hbmFnZWRfcGFn
ZV9jb3VudChwYWdlLCAtMSAqICgxIDw8IG9yZGVyKSk7Cj4gKwkJdmItPm51bV9wZm5zICs9IFZJ
UlRJT19CQUxMT09OX1BBR0VTX1BFUl9QQUdFICogKDEgPDwgb3JkZXIpOwo+ICAJfQo+ICAKPiAg
CW51bV9hbGxvY2F0ZWRfcGFnZXMgPSB2Yi0+bnVtX3BmbnM7Cj4gQEAgLTI4NCw3ICszMDAsNyBA
QCBzdGF0aWMgdW5zaWduZWQgbGVha19iYWxsb29uKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIs
IHNpemVfdCBudW0pCj4gIAkJcGFnZSA9IGJhbGxvb25fcGFnZV9kZXF1ZXVlKHZiX2Rldl9pbmZv
KTsKPiAgCQlpZiAoIXBhZ2UpCj4gIAkJCWJyZWFrOwo+IC0JCXNldF9wYWdlX3BmbnModmIsIHZi
LT5wZm5zICsgdmItPm51bV9wZm5zLCBwYWdlKTsKPiArCQlzZXRfcGFnZV9wZm5zKHZiLCB2Yi0+
cGZucyArIHZiLT5udW1fcGZucywgcGFnZSwgMCk7Cj4gIAkJbGlzdF9hZGQoJnBhZ2UtPmxydSwg
JnBhZ2VzKTsKPiAgCQl2Yi0+bnVtX3BhZ2VzIC09IFZJUlRJT19CQUxMT09OX1BBR0VTX1BFUl9Q
QUdFOwo+ICAJfQo+IEBAIC03ODYsNyArODAyLDcgQEAgc3RhdGljIGludCB2aXJ0YmFsbG9vbl9t
aWdyYXRlcGFnZShzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyAqdmJfZGV2X2luZm8sCj4gIAlfX2Nv
dW50X3ZtX2V2ZW50KEJBTExPT05fTUlHUkFURSk7Cj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZ2Yl9kZXZfaW5mby0+cGFnZXNfbG9jaywgZmxhZ3MpOwo+ICAJdmItPm51bV9wZm5zID0gVklS
VElPX0JBTExPT05fUEFHRVNfUEVSX1BBR0U7Cj4gLQlzZXRfcGFnZV9wZm5zKHZiLCB2Yi0+cGZu
cywgbmV3cGFnZSk7Cj4gKwlzZXRfcGFnZV9wZm5zKHZiLCB2Yi0+cGZucywgbmV3cGFnZSwgMCk7
Cj4gIAl0ZWxsX2hvc3QodmIsIHZiLT5pbmZsYXRlX3ZxKTsKPiAgCj4gIAkvKiBiYWxsb29uJ3Mg
cGFnZSBtaWdyYXRpb24gMm5kIHN0ZXAgLS0gZGVmbGF0ZSAicGFnZSIgKi8KPiBAQCAtNzk0LDcg
KzgxMCw3IEBAIHN0YXRpYyBpbnQgdmlydGJhbGxvb25fbWlncmF0ZXBhZ2Uoc3RydWN0IGJhbGxv
b25fZGV2X2luZm8gKnZiX2Rldl9pbmZvLAo+ICAJYmFsbG9vbl9wYWdlX2RlbGV0ZShwYWdlKTsK
PiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnZiX2Rldl9pbmZvLT5wYWdlc19sb2NrLCBmbGFn
cyk7Cj4gIAl2Yi0+bnVtX3BmbnMgPSBWSVJUSU9fQkFMTE9PTl9QQUdFU19QRVJfUEFHRTsKPiAt
CXNldF9wYWdlX3BmbnModmIsIHZiLT5wZm5zLCBwYWdlKTsKPiArCXNldF9wYWdlX3BmbnModmIs
IHZiLT5wZm5zLCBwYWdlLCAwKTsKPiAgCXRlbGxfaG9zdCh2YiwgdmItPmRlZmxhdGVfdnEpOwo+
ICAKPiAgCW11dGV4X3VubG9jaygmdmItPmJhbGxvb25fbG9jayk7Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvYmFsbG9vbl9jb21wYWN0aW9uLmggYi9pbmNsdWRlL2xpbnV4L2JhbGxvb25f
Y29tcGFjdGlvbi5oCj4gaW5kZXggMzM4YWEyN2U0NzczLi5lZDkzZmU1NzA0ZDEgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9saW51eC9iYWxsb29uX2NvbXBhY3Rpb24uaAo+ICsrKyBiL2luY2x1ZGUv
bGludXgvYmFsbG9vbl9jb21wYWN0aW9uLmgKPiBAQCAtNjAsNyArNjAsNyBAQCBzdHJ1Y3QgYmFs
bG9vbl9kZXZfaW5mbyB7Cj4gIAlzdHJ1Y3QgaW5vZGUgKmlub2RlOwo+ICB9Owo+ICAKPiAtZXh0
ZXJuIHN0cnVjdCBwYWdlICpiYWxsb29uX3BhZ2VfYWxsb2Modm9pZCk7Cj4gK2V4dGVybiBzdHJ1
Y3QgcGFnZSAqYmFsbG9vbl9wYWdlc19hbGxvYyhpbnQgb3JkZXIpOwo+ICBleHRlcm4gdm9pZCBi
YWxsb29uX3BhZ2VfZW5xdWV1ZShzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyAqYl9kZXZfaW5mbywK
PiAgCQkJCSBzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gIGV4dGVybiBzdHJ1Y3QgcGFnZSAqYmFsbG9v
bl9wYWdlX2RlcXVldWUoc3RydWN0IGJhbGxvb25fZGV2X2luZm8gKmJfZGV2X2luZm8pOwo+IEBA
IC03OCw2ICs3OCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYmFsbG9vbl9kZXZpbmZvX2luaXQo
c3RydWN0IGJhbGxvb25fZGV2X2luZm8gKmJhbGxvb24pCj4gIAliYWxsb29uLT5pbm9kZSA9IE5V
TEw7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmJhbGxvb25fcGFnZV9h
bGxvYyh2b2lkKQo+ICt7Cj4gKwlyZXR1cm4gYmFsbG9vbl9wYWdlc19hbGxvYygwKTsKPiArfQo+
ICsKPiAgI2lmZGVmIENPTkZJR19CQUxMT09OX0NPTVBBQ1RJT04KPiAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgYmFsbG9vbl9hb3BzOwo+ICBleHRlcm4gYm9v
bCBiYWxsb29uX3BhZ2VfaXNvbGF0ZShzdHJ1Y3QgcGFnZSAqcGFnZSwKPiBkaWZmIC0tZ2l0IGEv
bW0vYmFsbG9vbl9jb21wYWN0aW9uLmMgYi9tbS9iYWxsb29uX2NvbXBhY3Rpb24uYwo+IGluZGV4
IDI2ZGUwMjBhYWU3Yi4uMDY3ODEwYjMyODEzIDEwMDY0NAo+IC0tLSBhL21tL2JhbGxvb25fY29t
cGFjdGlvbi5jCj4gKysrIGIvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPiBAQCAtMTEyLDIzICsx
MTIsMzUgQEAgc2l6ZV90IGJhbGxvb25fcGFnZV9saXN0X2RlcXVldWUoc3RydWN0IGJhbGxvb25f
ZGV2X2luZm8gKmJfZGV2X2luZm8sCj4gIEVYUE9SVF9TWU1CT0xfR1BMKGJhbGxvb25fcGFnZV9s
aXN0X2RlcXVldWUpOwo+ICAKPiAgLyoKPiAtICogYmFsbG9vbl9wYWdlX2FsbG9jIC0gYWxsb2Nh
dGVzIGEgbmV3IHBhZ2UgZm9yIGluc2VydGlvbiBpbnRvIHRoZSBiYWxsb29uCj4gLSAqCQkJcGFn
ZSBsaXN0Lgo+ICsgKiBiYWxsb29uX3BhZ2VzX2FsbG9jIC0gYWxsb2NhdGVzIGEgbmV3IHBhZ2Ug
KG9mIGF0IG1vc3QgdGhlIGdpdmVuIG9yZGVyKQo+ICsgKiAJCQkgZm9yIGluc2VydGlvbiBpbnRv
IHRoZSBiYWxsb29uIHBhZ2UgbGlzdC4KPiAgICoKPiAgICogRHJpdmVyIG11c3QgY2FsbCB0aGlz
IGZ1bmN0aW9uIHRvIHByb3Blcmx5IGFsbG9jYXRlIGEgbmV3IGJhbGxvb24gcGFnZS4KPiAgICog
RHJpdmVyIG11c3QgY2FsbCBiYWxsb29uX3BhZ2VfZW5xdWV1ZSBiZWZvcmUgZGVmaW5pdGl2ZWx5
IHJlbW92aW5nIHRoZSBwYWdlCj4gICAqIGZyb20gdGhlIGd1ZXN0IHN5c3RlbS4KPiAgICoKPiAr
ICogV2lsbCBmYWxsIGJhY2sgdG8gc21hbGxlciBvcmRlcnMgaWYgYWxsb2NhdGlvbiBmYWlscy4g
VGhlIG9yZGVyIG9mIHRoZQo+ICsgKiBhbGxvY2F0ZWQgcGFnZSBpcyBzdG9yZWQgaW4gcGFnZS0+
cHJpdmF0ZS4KPiArICoKPiAgICogUmV0dXJuOiBzdHJ1Y3QgcGFnZSBmb3IgdGhlIGFsbG9jYXRl
ZCBwYWdlIG9yIE5VTEwgb24gYWxsb2NhdGlvbiBmYWlsdXJlLgo+ICAgKi8KPiAtc3RydWN0IHBh
Z2UgKmJhbGxvb25fcGFnZV9hbGxvYyh2b2lkKQo+ICtzdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdl
c19hbGxvYyhpbnQgb3JkZXIpCj4gIHsKPiAtCXN0cnVjdCBwYWdlICpwYWdlID0gYWxsb2NfcGFn
ZShiYWxsb29uX21hcHBpbmdfZ2ZwX21hc2soKSB8Cj4gLQkJCQkgICAgICAgX19HRlBfTk9NRU1B
TExPQyB8IF9fR0ZQX05PUkVUUlkgfAo+IC0JCQkJICAgICAgIF9fR0ZQX05PV0FSTik7Cj4gLQly
ZXR1cm4gcGFnZTsKPiArCXN0cnVjdCBwYWdlICpwYWdlOwo+ICsKPiArCXdoaWxlIChvcmRlciA+
PSAwKSB7Cj4gKwkJcGFnZSA9IGFsbG9jX3BhZ2VzKGJhbGxvb25fbWFwcGluZ19nZnBfbWFzaygp
IHwKPiArCQkJCSAgIF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPiArCQkJCSAg
IF9fR0ZQX05PV0FSTiwgb3JkZXIpOwo+ICsJCWlmIChwYWdlKSB7Cj4gKwkJCXNldF9wYWdlX3By
aXZhdGUocGFnZSwgb3JkZXIpOwo+ICsJCQlyZXR1cm4gcGFnZTsKPiArCQl9Cj4gKwkJb3JkZXIt
LTsKPiArCX0KPiArCXJldHVybiBOVUxMOwo+ICB9Cj4gLUVYUE9SVF9TWU1CT0xfR1BMKGJhbGxv
b25fcGFnZV9hbGxvYyk7Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGJhbGxvb25fcGFnZXNfYWxsb2Mp
Owo+ICAKPiAgLyoKPiAgICogYmFsbG9vbl9wYWdlX2VucXVldWUgLSBpbnNlcnRzIGEgbmV3IHBh
Z2UgaW50byB0aGUgYmFsbG9vbiBwYWdlIGxpc3QuCgoKSSB0aGluayB0aGlzIHdpbGwgdHJ5IHRv
IGludm9rZSBkaXJlY3QgcmVjbGFpbSBmcm9tIHRoZSBmaXJzdCBpdGVyYXRpb24KdG8gZnJlZSB1
cCB0aGUgbWF4IG9yZGVyLgoKPiBAQCAtMTQ2LDEwICsxNTgsMjMgQEAgRVhQT1JUX1NZTUJPTF9H
UEwoYmFsbG9vbl9wYWdlX2FsbG9jKTsKPiAgdm9pZCBiYWxsb29uX3BhZ2VfZW5xdWV1ZShzdHJ1
Y3QgYmFsbG9vbl9kZXZfaW5mbyAqYl9kZXZfaW5mbywKPiAgCQkJICBzdHJ1Y3QgcGFnZSAqcGFn
ZSkKPiAgewo+ICsJY29uc3QgaW50IG9yZGVyID0gcGFnZV9wcml2YXRlKHBhZ2UpOwo+ICAJdW5z
aWduZWQgbG9uZyBmbGFnczsKPiArCWludCBpOwo+ICsKPiArCS8qCj4gKwkgKiBXZSBjYW4gb25s
eSBtaWdyYXRlIHNpbmdsZSBwYWdlcyAtIGFuZCBldmVuIGlmIHdlIGNvdWxkIG1pZ3JhdGUKPiAr
CSAqIGJpZ2dlciBvbmVzLCB3ZSB3b3VsZCB3YW50IHRvIHNwbGl0IHRoZW0gb24gZGVtYW5kIGlu
c3RlYWQgb2YKPiArCSAqIHRyeWluZyB0byBtb3ZlIGFyb3VuZCBiaWcgY2h1bmtzLgo+ICsJICov
Cj4gKwlpZiAob3JkZXIgPiAwKQo+ICsJCXNwbGl0X3BhZ2UocGFnZSwgb3JkZXIpOwo+ICsJc2V0
X3BhZ2VfcHJpdmF0ZShwYWdlLCBvcmRlcik7Cj4gIAo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmJf
ZGV2X2luZm8tPnBhZ2VzX2xvY2ssIGZsYWdzKTsKPiAtCWJhbGxvb25fcGFnZV9lbnF1ZXVlX29u
ZShiX2Rldl9pbmZvLCBwYWdlKTsKPiArCWZvciAoaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkr
KykKPiArCQliYWxsb29uX3BhZ2VfZW5xdWV1ZV9vbmUoYl9kZXZfaW5mbywgcGFnZSArIGkpOwo+
ICsKPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmJfZGV2X2luZm8tPnBhZ2VzX2xvY2ssIGZs
YWdzKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChiYWxsb29uX3BhZ2VfZW5xdWV1ZSk7Cj4g
LS0gCj4gMi4yNS4xCj4gCj4gLS0gCj4gVGhhbmtzLAo+IAo+IERhdmlkIC8gZGhpbGRlbmIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
