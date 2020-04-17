Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B607E1AD961
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A9BC87E09;
	Fri, 17 Apr 2020 09:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T33x3SiEaFhp; Fri, 17 Apr 2020 09:03:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F87387D80;
	Fri, 17 Apr 2020 09:03:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44500C0172;
	Fri, 17 Apr 2020 09:03:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A983DC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 93EA587601
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpso16dWyREr
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:03:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7C7E5875FE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587114080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LYdr3kSxXBMDicQAv0M7nkPT5YyAgLG/RWsjILE6Rk=;
 b=dCeJxIQ3mkjtD9bwvPhSkJecKXOSnr8/RwDJB4Nl6IXCco0s/11pIy5So6pYFoqE4K+O1U
 sSqecPQCDYVgHW98hMFlSqXfzWrbfPR0coKizjNN0xYorh2gthNVVqhxnjBGJqYwXFwMNg
 EkjKPqgyYlc655//L9MTpoEeKKSX3z0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587114207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LYdr3kSxXBMDicQAv0M7nkPT5YyAgLG/RWsjILE6Rk=;
 b=D8bw9O/TFTVOc8XjFir/g0k8SROgpFj0Tr40zBFhoPj1W6xukN/tE/VzvjT70siFjDH16Z
 kHrSeow5W7oBsMagOFV3rBQcvCDJtKTfk6JqUfCCMi7iT6kN7QrWcJvioLjxuJhj/JsMVO
 Iia+JQEqBTojmUsj926Gj7yrACfxrQQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-uEu2DyrDNA2mVcIiO8TQGA-1; Fri, 17 Apr 2020 05:01:18 -0400
X-MC-Unique: uEu2DyrDNA2mVcIiO8TQGA-1
Received: by mail-wr1-f72.google.com with SMTP id h95so668199wrh.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 02:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+LYdr3kSxXBMDicQAv0M7nkPT5YyAgLG/RWsjILE6Rk=;
 b=Jw5vZlwB+GWs3bqbqBP7F9LNwvNiA9z3Ab4pv+gacN/jIMOOzWiN/cCzDMixWZ/AFE
 Hp12ccN346+QE+KiNwtULsvF+/Au/14RbYxx64Xf/obAthDsQSX5FMeTrlJQ4aFSyW8G
 BPqAIMYkxrOaeMF4twePtDZOg2PyPu8sKlqISl0QXAtUNSiIpe09v0OhSY8IE5xDGW2w
 oSG0N5LfkB78dcM/BRUCQigpQcQThxDS36SHXauPJeUXc75FY/p9ntXIKaupdgUzh/ju
 0mHZw5CL7ugkB+jTyriqgSWi2oVIHb3HLMFeDuSQ1k8tA4hov3WgZnFfHb2IvuC2wlZi
 7tGQ==
X-Gm-Message-State: AGi0PubudlrQk5mU9mtFK3a9336CwFjsdQP13wkDqv3J8DjTdIAiAIII
 BYqOVGIuqQEzApayiSV+6yNSsZ3egQObWimyKKsTF6rl4HEGKfW7E1mFGz2JLU3biD/JC2hIcVa
 7+VXq0fRj1sSd8urcvnIZvUhcuQNszXa1qIAbF0o/qQ==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr2155041wmc.146.1587114077408; 
 Fri, 17 Apr 2020 02:01:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypK2vbW1OnmBJFQVh7bub7YEhkI6cUby2dGaO6wz+YQlB7a8+Q2NUcfxoXyc58GWwBIeKSXJyQ==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr2155008wmc.146.1587114077204; 
 Fri, 17 Apr 2020 02:01:17 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id c20sm7408863wmd.36.2020.04.17.02.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:01:16 -0700 (PDT)
Date: Fri, 17 Apr 2020 05:01:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417050029-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
MIME-Version: 1.0
In-Reply-To: <73843240-3040-655d-baa9-683341ed4786@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6NTE6MTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTcg5LiL5Y2INDo0NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6Mzk6NDlQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC80LzE3IOS4i+WNiDQ6MjksIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEFwciAxNywgMjAyMCBhdCAwMzozNjo1MlBNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAyMC80LzE3IOS4i+WNiDI6MzMsIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCBBcHIgMTcsIDIwMjAg
YXQgMTE6MTI6MTRBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiAy
MDIwLzQvMTcg5LiK5Y2INjo1NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gT24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMTA6NDM6NTZBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNvbmZpZyB1
bnRvdWNoZWQgYWZ0ZXIgZGVjb3VwbGluZyBDT05GSUdfVkhPU1QKPiA+ID4gPiA+ID4gPiA+ID4g
b3V0IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTiBpbiBjb21taXQgMjBjMzg0ZjFlYTFhCj4gPiA+
ID4gPiA+ID4gPiA+ICgidmhvc3Q6IHJlZmluZSB2aG9zdCBhbmQgdnJpbmdoIGtjb25maWciKSBi
eSBlbmFibGluZyBWSE9TVF9NRU5VIGJ5Cj4gPiA+ID4gPiA+ID4gPiA+IGRlZmF1bHQuIFRoZW4g
dGhlIGRlZmNvbmZpZ3MgY2FuIGtlZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05FVAo+ID4gPiA+
ID4gPiA+ID4gPiB3aXRob3V0IHRoZSBjYXJpbmcgb2YgQ09ORklHX1ZIT1NULgo+ID4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gQnV0IHRoaXMgd2lsbCBsZWF2ZSBhICJDT05GSUdf
VkhPU1RfTUVOVT15IiBpbiBhbGwgZGVmY29uZmlncyBhbmQgZXZlbgo+ID4gPiA+ID4gPiA+ID4g
PiBmb3IgdGhlIG9uZXMgdGhhdCBkb2Vzbid0IHdhbnQgdmhvc3QuIFNvIGl0IGFjdHVhbGx5IHNo
aWZ0cyB0aGUKPiA+ID4gPiA+ID4gPiA+ID4gYnVyZGVucyB0byB0aGUgbWFpbnRhaW5lcnMgb2Yg
YWxsIG90aGVyIHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMKPiA+ID4gPiA+ID4gPiA+ID4g
bm90IHNldCIuIFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19WSE9TVCBleHBs
aWNpdGx5IGluCj4gPiA+ID4gPiA+ID4gPiA+IGRlZmNvbmZpZ3MgdGhhdCBlbmFibGVzIENPTkZJ
R19WSE9TVF9ORVQgYW5kIENPTkZJR19WSE9TVF9WU09DSy4KPiA+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gQm9ybnRyYWVnZXI8Ym9ybnRyYWVn
ZXJAZGUuaWJtLmNvbT4gICAoczM5MCkKPiA+ID4gPiA+ID4gPiA+ID4gQWNrZWQtYnk6IE1pY2hh
ZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1PiAgIChwb3dlcnBjKQo+ID4gPiA+ID4gPiA+
ID4gPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlcjx0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRlPgo+
ID4gPiA+ID4gPiA+ID4gPiBDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdDxiZW5oQGtlcm5lbC5j
cmFzaGluZy5vcmc+Cj4gPiA+ID4gPiA+ID4gPiA+IENjOiBQYXVsIE1hY2tlcnJhczxwYXVsdXNA
c2FtYmEub3JnPgo+ID4gPiA+ID4gPiA+ID4gPiBDYzogTWljaGFlbCBFbGxlcm1hbjxtcGVAZWxs
ZXJtYW4uaWQuYXU+Cj4gPiA+ID4gPiA+ID4gPiA+IENjOiBIZWlrbyBDYXJzdGVuczxoZWlrby5j
YXJzdGVuc0BkZS5pYm0uY29tPgo+ID4gPiA+ID4gPiA+ID4gPiBDYzogVmFzaWx5IEdvcmJpazxn
b3JAbGludXguaWJtLmNvbT4KPiA+ID4gPiA+ID4gPiA+ID4gQ2M6IENocmlzdGlhbiBCb3JudHJh
ZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+ID4gPiA+ID4gPiA+ID4gPiBSZXBvcnRlZC1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+
ID4gPiA+ID4gPiBJIHJlYmFzZWQgdGhpcyBvbiB0b3Agb2YgT0FCSSBmaXggc2luY2UgdGhhdAo+
ID4gPiA+ID4gPiA+ID4gc2VlbXMgbW9yZSBvcmdlbnQgdG8gZml4Lgo+ID4gPiA+ID4gPiA+ID4g
UHVzaGVkIHRvIG15IHZob3N0IGJyYW5jaCBwbHMgdGFrZSBhIGxvb2sgYW5kCj4gPiA+ID4gPiA+
ID4gPiBpZiBwb3NzaWJsZSB0ZXN0Lgo+ID4gPiA+ID4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+ID4g
PiA+IEkgdGVzdCB0aGlzIHBhdGNoIGJ5IGdlbmVyYXRpbmcgdGhlIGRlZmNvbmZpZ3MgdGhhdCB3
YW50cyB2aG9zdF9uZXQgb3IKPiA+ID4gPiA+ID4gPiB2aG9zdF92c29jay4gQWxsIGxvb2tzIGZp
bmUuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQnV0IGhhdmluZyBDT05GSUdfVkhPU1Rf
RFBOPXkgbWF5IGVuZCB1cCB3aXRoIHRoZSBzaW1pbGFyIHNpdHVhdGlvbiB0aGF0Cj4gPiA+ID4g
PiA+ID4gdGhpcyBwYXRjaCB3YW50IHRvIGFkZHJlc3MuCj4gPiA+ID4gPiA+ID4gTWF5YmUgd2Ug
Y2FuIGxldCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiAhQVJNIHx8IEFFQUJJIHRoZW4gYWRkIGFu
b3RoZXIKPiA+ID4gPiA+ID4gPiBtZW51Y29uZmlnIGZvciBWSE9TVF9SSU5HIGFuZCBkbyBzb21l
dGhpbmcgc2ltaWxhcj8KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGFua3MKPiA+ID4g
PiA+ID4gU29ycnkgSSBkb24ndCB1bmRlcnN0YW5kLiBBZnRlciB0aGlzIHBhdGNoIENPTkZJR19W
SE9TVF9EUE4gaXMganVzdAo+ID4gPiA+ID4gPiBhbiBpbnRlcm5hbCB2YXJpYWJsZSBmb3IgdGhl
IE9BQkkgZml4LiBJIGtlcHQgaXQgc2VwYXJhdGUKPiA+ID4gPiA+ID4gc28gaXQncyBlYXN5IHRv
IHJldmVydCBmb3IgNS44LiBZZXMgd2UgY291bGQgc3F1YXNoIGl0IGludG8KPiA+ID4gPiA+ID4g
VkhPU1QgZGlyZWN0bHkgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0IGNoYW5nZXMgbG9naWMgYXQg
YWxsLgo+ID4gPiA+ID4gU29ycnkgZm9yIGJlaW5nIHVuY2xlYXIuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IEkgbWVhbnQgc2luY2UgaXQgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCwgIkNPTkZJR19WSE9T
VF9EUE49eSIgd2lsbCBiZSBsZWZ0Cj4gPiA+ID4gPiBpbiB0aGUgZGVmY29uZmlncy4KPiA+ID4g
PiBCdXQgd2hvIGNhcmVzPwo+ID4gPiBGWUksIHBsZWFzZSBzZWVodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9rdm0vbXNnMjEyNjg1Lmh0bWwKPiA+IFRoZSBjb21wbGFpbnQgd2FzIG5vdCBh
Ym91dCB0aGUgc3ltYm9sIElJVUMuICBJdCB3YXMgdGhhdCB3ZSBjYXVzZWQKPiA+IGV2ZXJ5b25l
IHRvIGJ1aWxkIHZob3N0IHVubGVzcyB0aGV5IG1hbnVhbGx5IGRpc2FibGVkIGl0Lgo+IAo+IAo+
IFRoZXJlIGNvdWxkIGJlIHNvbWUgbWlzdW5kZXJzdGFuZGluZyBoZXJlLiBJIHRob3VnaHQgaXQn
cyBzb21laG93IHNpbWlsYXI6IGEKPiBDT05GSUdfVkhPU1RfTUVOVT15IHdpbGwgYmUgbGVmdCBp
biB0aGUgZGVmY29uZmlncyBldmVuIGlmIENPTkZJR19WSE9TVCBpcwo+IG5vdCBzZXQuCj4gCj4g
VGhhbmtzCj4gCgpCVFcgZG8gZW50cmllcyB3aXRoIG5vIHByb21wdCBhY3R1YWxseSBhcHBlYXIg
aW4gZGVmY29uZmlnPwoKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
