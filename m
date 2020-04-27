Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD61BAD4A
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 20:53:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A347222176;
	Mon, 27 Apr 2020 18:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otj2wrBdsB0a; Mon, 27 Apr 2020 18:43:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5C03D220D0;
	Mon, 27 Apr 2020 18:43:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4811BC003B;
	Mon, 27 Apr 2020 18:43:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A087C003B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E7074220D0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VF2ONhwCk3Qg
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:43:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by silver.osuosl.org (Postfix) with ESMTPS id 1981E2034B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 18:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeffvfeuTqt3XumNOX5oLva5DOlv98YJh90LRIMzfP6sf8c4xfr2+pjjEbADb7yGaoO1YVDoMifbp1aQuShE6K/xNVzgqVfQBbpPJDEP/sx7fFXxK1+1ugBVX/xEtQt8YvvVS3sfzmrc7IpwzrJGc1X2s2xqhP2uaJPBVKO3H8duVi2gsP6ytLT78mohFeb2+OV0yVKE165x9B58wmTLFV/SnJN65rikVmJMxWfJOO9B6m83Lp4EForR2Bc0kMo3iYMGJRvxhlutCazIik/slcS9CM+BH7BkHj+yvO7k67d0ddhcnYFQaA07mDPUaiFmatlJmxqAmLmMue0FjjEDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWU8NYX6jE4fjzz6zeySRAYoQ655Sm4zyPCJVDiXcyI=;
 b=d7yvCVHGxuLn7pI93xeLbWBrgCse79kAPWZDZ3RXNHxFwrJp0O9rkF4nXbn856ZvcaeGn75BWKPFPaVJlOWeTQYAWTwiA9O8dI0QdkrTJD/vCTJ3t+uGmqRYkCVXSvaEKurqKkOvW+TP3FbvmF0pos59i4LWbPUmMC2vPXMc9f7HmON3rzN9tMquWB9p4TKhgDExvg1o1qc628Y/QI86q1cp78NZkVC3cy8uCHWeN4vdaVjGQOBCagIGJdHWOd5L9mdXod7tsV2b6Y8MjJYzwluoJi1SEbug9ewF+k47cTYzc0ElEcuRuiuqqwX1findo2nkKYlxsu90Ez03Vzy6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWU8NYX6jE4fjzz6zeySRAYoQ655Sm4zyPCJVDiXcyI=;
 b=W+CR6FCj4RZLIDFE/ck2JqJ2RY5tgJ1aiXlDaDhpz0gP/JNmhLnFOIsktZIPNEmRNNRYeyju98hV3EzobpZSLFzyMu6aLXpu2x4JWu8Y4+zctYXs9WsubelumWf64aExRCIQVI9wBcfjF6yMP+Z8QtBt2FvGxtrbDmAv2/oerfE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thomas.Lendacky@amd.com; 
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB1818.namprd12.prod.outlook.com (2603:10b6:3:114::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Mon, 27 Apr 2020 18:43:27 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::4ce1:9947:9681:c8b1]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::4ce1:9947:9681:c8b1%10]) with mapi id 15.20.2937.020; Mon, 27 Apr
 2020 18:43:27 +0000
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Andy Lutomirski <luto@kernel.org>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <9b26ac10-27d1-96d8-d00e-2be511853024@amd.com>
Date: Mon, 27 Apr 2020 13:43:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: SN4PR0201CA0017.namprd02.prod.outlook.com
 (2603:10b6:803:2b::27) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0201CA0017.namprd02.prod.outlook.com (2603:10b6:803:2b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Mon, 27 Apr 2020 18:43:25 +0000
X-Originating-IP: [67.79.209.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8122fa1d-6f5e-47e1-7080-08d7eadadf7a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1818:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1818A7CACBBF02FD67BE17CBECAF0@DM5PR12MB1818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(186003)(66476007)(16526019)(66946007)(66556008)(956004)(5660300002)(86362001)(2616005)(6512007)(6916009)(2906002)(478600001)(31696002)(4326008)(31686004)(6486002)(81156014)(36756003)(8676002)(7416002)(6506007)(52116002)(53546011)(26005)(316002)(54906003)(8936002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOKPxNm4Xkr9ivnsOhR53m6bh5uXQMlcbNCsJXwttIcXU3jObBZSy7tYURuBrNcHcj+VxmK2wLp/7Va7RaxGH2PM2oS53+AJ3qcBUxORA9BchjeZztegh3025jR0NaN1Hq28mKalWSPpniUcyEBtIBTdChAC2lYYAHz9TnI25taWbuVR0joYrJN7c1qJizgj21/YG/V19DPGNEMnR0/D7pu8dLwk5UgddUSiF16RcBmh3VZTsi1MlnFbgpSVo22DkkUK/UjeSJQU6/ZXBDRn+wa17MvHSDXurnc6YHDl1gAXUpjQFNmSF/fcAqTtPzy9fiwiKzovqkp7OjSSIKqsBmuGBkyhVevpTcRkz9WQq+kgzWGoVMWfEliRs1XoTyI8q7QEVt3DSc7oejL2X2v2aqmwOLTto1cg7QizZM1yHqGrDCqLq/QINXuUnPWyrRz8
X-MS-Exchange-AntiSpam-MessageData: aT7GRO19xFCjFKfJlkLCi92wOF2N/I0F7yX6HMoSn8BOgrZem3IQM8ccIEJ4iD/HmBIAYyklqz97zQ/yz6SgpKza+//HPweHBQhJ7skqIv2ApxpqEgGJV2JUJlO47O57Ayct5RXru7CoKskvnAw8HXOEaHavTAwQL08KRREnKfsyOEV44O3U5mc0uf+jNOqsBCoZqhfO3/o5prx/IdCjA/8H6PA7QVxhJG7FccDzANo8BRsRLhbD8hSDb8SYnkUtdQmqWa/JKygyW2X/dHDv0+mL3ycFsS/vzJcs6XZFIl4pxghgGlmbcOez/Ur+Z5Gh2X/prA7w+AoSD1NU9VYCFOk0OE0WszcTv3wAWl4Zkg7prwTqeH4NEzcg45h8uEk/L9L0gdP4A+0PjAgsiYFc+WPcYYb0rqFIHqi3o/BdyC1Wp2WtyPve/AvalB8H2ApObe9P2heoW58GQuLa0ABPwhR8e9spfMQ+UwtdeS7Hs2T7I71HsJ65zJl3hZVeZ1qSetIZ93K8e1/wW3u+7UgNgvHH4TgkTNSMci8+PrW9sEVKjUdHNkURik25QgZiwXAXGnmC1fteZNRxNKdNKvZoSrk0VDjS7LUB0JW2SyOv1y2iZuFkDqrk5Vm5QwQTY9T6teyYiTq6oN4zqbwTRRcsDMYW/98jXNVhFDhLy+1g2mCjxKk3eCPxJ5b33K/LPDAQTCOPOjJDlUDrZaKL3bSgpG8o/9jKELxVZSTgonwhvAowV8OZ3NzhDHUzu8K9HUKVG/unBYAxJ9uLUg21Q0UDJMNXXsfdcNxBbkAAiRt03zU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8122fa1d-6f5e-47e1-7080-08d7eadadf7a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 18:43:27.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x14bk3anfG9BzlyJSA90uLutHZrhG7tZbHHoqCbr+/qE1LPl6H8dpk8/ft572zpHfjWNE5R/GokeqRZiTG0BrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
Cc: Juergen Gross <JGross@suse.com>, X86 ML <x86@kernel.org>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 4/27/20 12:37 PM, Andy Lutomirski wrote:
> On Sat, Apr 25, 2020 at 3:10 PM Andy Lutomirski <luto@kernel.org> wrote:
>>
>> On Sat, Apr 25, 2020 at 1:23 PM Joerg Roedel <joro@8bytes.org> wrote:
>>>
>>> On Sat, Apr 25, 2020 at 12:47:31PM -0700, Andy Lutomirski wrote:
>>>> I assume the race you mean is:
>>>>
>>>> #VC
>>>> Immediate NMI before IST gets shifted
>>>> #VC
>>>>
>>>> Kaboom.
>>>>
>>>> How are you dealing with this?  Ultimately, I think that NMI will need
>>>> to turn off IST before engaging in any funny business. Let me ponder
>>>> this a bit.
>>>
>>> Right, I dealt with that by unconditionally shifting/unshifting the #VC IST entry
>>> in do_nmi() (thanks to Davin Kaplan for the idea). It might cause
>>> one of the IST stacks to be unused during nesting, but that is fine. The
>>> stack memory for #VC is only allocated when SEV-ES is active (in an
>>> SEV-ES VM).
>>
>> Blech.  It probably works, but still, yuck.  It's a bit sad that we
>> seem to be growing more and more poorly designed happens-anywhere
>> exception types at an alarming rate.  We seem to have #NM, #MC, #VC,
>> #HV, and #DB.  This doesn't really scale.
> 
> I have a somewhat serious question: should we use IST for #VC at all?
> As I understand it, Rome and Naples make it mandatory for hypervisors
> to intercept #DB, which means that, due to the MOV SS mess, it's sort
> of mandatory to use IST for #VC.  But Milan fixes the #DB issue, so,
> if we're running under a sufficiently sensible hypervisor, we don't
> need IST for #VC.
> 
> So I think we have two choices:
> 
> 1. Use IST for #VC and deal with all the mess that entails.
> 
> 2. Say that we SEV-ES client support on Rome and Naples is for
> development only and do a quick boot-time check for whether #DB is
> intercepted.  (Just set TF and see what vector we get.)  If #DB is
> intercepted, print a very loud warning and refuse to boot unless some
> special sev_es.insecure_development_mode or similar option is set.
> 
> #2 results in simpler and more robust entry code.  #1 is more secure.
> 
> So my question is: will anyone actually use SEV-ES in production on
> Rome or Naples?  As I understand it, it's not really ready for prime
> time on those chips.  And do we care if the combination of a malicious

Naples was limited in the number of encryption keys available for guests 
(15), but Rome increased that significantly (509). SEV-ES is ready on 
those chips - Rome more so with the increased key count given the 
requirement that SEV and SEV-ES guests have non-overlapping ASID ranges 
(which corresponds to key usage).

Thanks,
Tom

> hypervisor and malicious guest userspace on Milan can compromise the
> guest kernel?  I don't think SEV-ES is really mean to resist a
> concerted effort by the hypervisor to compromise the guest.
> 
> --Andy
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
