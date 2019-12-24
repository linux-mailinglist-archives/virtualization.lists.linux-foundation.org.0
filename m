Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A6129FAA
	for <lists.virtualization@lfdr.de>; Tue, 24 Dec 2019 10:28:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C62886F3A;
	Tue, 24 Dec 2019 09:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZNMbkfY4nBw; Tue, 24 Dec 2019 09:28:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF3B586ECC;
	Tue, 24 Dec 2019 09:28:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A54DEC0881;
	Tue, 24 Dec 2019 09:28:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D25EBC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0C3484AB2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jL85syfDCSil
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 09:28:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2077C84AAD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577179704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9io39MapNxb9iVLyPk4R6ZIbMC7c4yRkMWk9UfOh+Yw=;
 b=B9EkRlsFgU4Ik3goT5iuDtWUP6xRn1DxOVZ9cvBliUMyakqEkBSK029Gr7ulQaP3Kkhl35
 zySFMEf/kt2zCygQcVgtLP+JoJbdxZ1GAE5q9IGxSkbblJHlAH5sOlMFFBwMqjuPVUtFvL
 flDlIE50lqhSJDoK0Pwnbc10E7GH2NE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-iT4Mn-CtN_KpSqkTcw-D6A-1; Tue, 24 Dec 2019 04:28:22 -0500
Received: by mail-wm1-f70.google.com with SMTP id n17so259486wmk.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 01:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=sdq63IePYHAZah7URn5zkx4Y6XBmFNMvwu4Q1uK3z8k=;
 b=RhNDYSQiV9HprszOC94EYqnLRyuxQ54Af3kuxhK+VzGvYVViWMY4frm7ceXrw1HPnJ
 Smf5+RLfI/gSkFXwyWlitK6lfR8ZXV+HLkiMRJthRCZ0Eilv5jeWPRo2QRelDqPm1V6e
 dXcA6Rx2M77Vf0BSqnQpw8/StPLvIjQerM0jr+yn/VzCrbgp4HS+8hQ+jroleL2lg50k
 bi+5XEVLwUyBBmIxvjHvhCvThVFd7g0TQ0/EviIoLlKqpBJ1svx3q2QntM75XK3J+to0
 mJASBdcAxyoTItntcot7H6Ox7C3Hc1Rub3T/UnzGKGUHY5rzKGAx3g+LjGDOkXuHk/td
 YlEA==
X-Gm-Message-State: APjAAAXmKwlJKRaYtb6nQTHBClbB0GAM+htG0FVn0Mi39O+449Dxf155
 uNVxnphxXhsRRnsw6nzFO+vsoaSlGaJ9bfHRf6HrX75oPj0FdHkCRe9xRRauux9BCLMX74xb/9G
 dAYZTWekxCIugPAembOk/HoU7aEKeCgD2fI8wCxJ6Sw==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr35990706wrs.276.1577179701822; 
 Tue, 24 Dec 2019 01:28:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9/TSLj5c5X1JnE2/hzqVf4qICkFRn7uD3XRturCTmvjkz0LR8yv7IDInsAtlJzkhhu/UF3g==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr35990685wrs.276.1577179701626; 
 Tue, 24 Dec 2019 01:28:21 -0800 (PST)
Received: from ?IPv6:2003:d8:2f31:4c00:d9fc:8de:fc42:5adc?
 (p200300D82F314C00D9FC08DEFC425ADC.dip0.t-ipconnect.de.
 [2003:d8:2f31:4c00:d9fc:8de:fc42:5adc])
 by smtp.gmail.com with ESMTPSA id s3sm2070447wmh.25.2019.12.24.01.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 01:28:21 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
Date: Tue, 24 Dec 2019 10:28:20 +0100
Message-Id: <2828152B-D0EB-4802-A304-4A90CA5C4B6C@redhat.com>
References: <91ED8152-61FC-4E87-9F7B-44CD05C77279@linux.alibaba.com>
In-Reply-To: <91ED8152-61FC-4E87-9F7B-44CD05C77279@linux.alibaba.com>
To: teawater <teawaterz@linux.alibaba.com>
X-Mailer: iPhone Mail (17C54)
X-MC-Unique: iT4Mn-CtN_KpSqkTcw-D6A-1
X-Mimecast-Spam-Score: 0
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Robert Bradford <robert.bradford@intel.com>,
 Pingfan Liu <kernelfans@gmail.com>, Luiz Capitulino <lcapitulino@redhat.com>,
 Linux MM <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Dave Young <dyoung@redhat.com>,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Samuel Ortiz <samuel.ortiz@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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

Cgo+IEFtIDI0LjEyLjIwMTkgdW0gMDg6MDQgc2NocmllYiB0ZWF3YXRlciA8dGVhd2F0ZXJ6QGxp
bnV4LmFsaWJhYmEuY29tPjoKPiAKPiDvu79IaSBEYXZpZCwKPiAKPiBUaGFua3MgZm9yIHlvdXIg
d29yay4KPiAKPiBJIEdvdCBmb2xsb3dpbmcgYnVpbGQgZmFpbCBpZiBYODZfNjRfQUNQSV9OVU1B
IGlzIG4gd2l0aCByZmMzIGFuZCByZmM0Ogo+IG1ha2UgLWo4IGJ6SW1hZ2UKPiAgR0VOICAgICBN
YWtlZmlsZQo+ICBERVNDRU5EICBvYmp0b29sCj4gIENBTEwgICAgL2hvbWUvdGVhd2F0ZXIva2Vy
bmVsL2xpbnV4LXVwc3RyZWFtMy9zY3JpcHRzL2F0b21pYy9jaGVjay1hdG9taWNzLnNoCj4gIENB
TEwgICAgL2hvbWUvdGVhd2F0ZXIva2VybmVsL2xpbnV4LXVwc3RyZWFtMy9zY3JpcHRzL2NoZWNr
c3lzY2FsbHMuc2gKPiAgQ0hLICAgICBpbmNsdWRlL2dlbmVyYXRlZC9jb21waWxlLmgKPiAgQ0Mg
ICAgICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWVtLm8KPiAvaG9tZS90ZWF3YXRlci9rZXJuZWwv
bGludXgtdXBzdHJlYW0zL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tZW0uYzogSW4gZnVuY3Rpb24g
4oCYdmlydGlvX21lbV90cmFuc2xhdGVfbm9kZV9pZOKAmToKPiAvaG9tZS90ZWF3YXRlci9rZXJu
ZWwvbGludXgtdXBzdHJlYW0zL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tZW0uYzo0Nzg6MTA6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhweG1fdG9fbm9kZeKAmSBb
LVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIG5vZGUgPSBweG1fdG9f
bm9kZShub2RlX2lkKTsKPiAgICAgICAgICBefn5+fn5+fn5+fgo+IGNjMTogc29tZSB3YXJuaW5n
cyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IC9ob21lL3RlYXdhdGVyL2tlcm5lbC9saW51eC11
cHN0cmVhbTMvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNjU6IHJlY2lwZSBmb3IgdGFyZ2V0ICdk
cml2ZXJzL3ZpcnRpby92aXJ0aW9fbWVtLm8nIGZhaWxlZAo+IG1ha2VbM106ICoqKiBbZHJpdmVy
cy92aXJ0aW8vdmlydGlvX21lbS5vXSBFcnJvciAxCj4gL2hvbWUvdGVhd2F0ZXIva2VybmVsL2xp
bnV4LXVwc3RyZWFtMy9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUwMzogcmVjaXBlIGZvciB0YXJn
ZXQgJ2RyaXZlcnMvdmlydGlvJyBmYWlsZWQKPiBtYWtlWzJdOiAqKiogW2RyaXZlcnMvdmlydGlv
XSBFcnJvciAyCj4gL2hvbWUvdGVhd2F0ZXIva2VybmVsL2xpbnV4LXVwc3RyZWFtMy9NYWtlZmls
ZToxNjQ5OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycycgZmFpbGVkCj4gbWFrZVsxXTogKioq
IFtkcml2ZXJzXSBFcnJvciAyCj4gL2hvbWUvdGVhd2F0ZXIva2VybmVsL2xpbnV4LXVwc3RyZWFt
My9NYWtlZmlsZToxNzk6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzdWItbWFrZScgZmFpbGVkCj4gbWFr
ZTogKioqIFtzdWItbWFrZV0gRXJyb3IgMgo+IAoKVGhhbmtzIEh1aSwKClNvIGl0IGhhcyB0byBi
ZSB3cmFwcGVkIGluIGFuIGlmZGVmLCB0aGFua3MhCgpDaGVlcnMhCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
